class ArticlesController < ApplicationController
  before_filter :require_author, :except => [:latest, :show]

  def latest
    @article = Article.latest
    unless @article.nil?
      @comment = Comment.new(:article_id => @article.id)
    else
      redirect_to(articles_url)
    end
  end

  def print
    @article = Article.find(params[:id])
    render :layout => "print"
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
    render :action => "latest"
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article
    else
      render :action => 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(articles_url)
  end
end
