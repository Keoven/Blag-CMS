class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Comment was successfuly posted."
      redirect_to article_path(@article)
    else
      flash[:notice] = "Failed to post comment."
      render :template => "articles/latest"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_comments_path(@comment.article_id)
  end

end
