class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build
    render :template => "articles/latest"
    #@comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def create
    @article = Article.find(params[:article_id])
    #@comment = Comment.new(params.merge(:article => @article.id))
    @comment = @article.comments.build(params[:comment])
    #Under ActiveRecord::Base .new_record?
    if @comment.save
      flash[:notice] = "Comment was successfuly posted."
      redirect_to article_path(@article)
    else
      flash[:notice] = "Failed to post comment."
      render :template => "articles/latest"
    end
=begin
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to @comment
    else
      render :action => 'new'
    end
=end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(comments_url)
  end

end
