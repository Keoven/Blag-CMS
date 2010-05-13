class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Comment was successfuly posted."
      render :partial => 'articles/single_comment', :locals => {:comment => @comment, 
                                                                :article => @article,
                                                                :first => (@article.comments.length == 1 ? true : false)}
    else
      flash[:notice] = "Failed to post comment."
      render :partial => 'error', :locals => {:comment => @comment, :article => @article}, :status => 444
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_comments_path(@comment.article_id)
  end

  def destroy_by_author
    @comment = Comment.find(params[:id])
    @article = @comment.article_id
    @comment.delete_by_author(params[:author_id])
    redirect_to article_path(@article)
  end

end
