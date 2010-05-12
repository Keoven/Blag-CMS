class LikeablesController < ApplicationController
  def create
    Likeable.new(params[:likeable]).save
    render :partial => 'articles/article_controls', :locals => {:article     => Article.find(params[:likeable][:article_id]),
                                                                :like_status => params[:likeable][:like_status]}
  end

  def update
    conditions = "author_id = #{params[:likeable][:author_id]} AND article_id = #{params[:likeable][:article_id]}"
    @like = Likeable.find(:first, :conditions => conditions)
    @like.update_attributes(params[:likeable])
    render :partial => 'articles/article_controls', :locals => {:article     => Article.find(params[:likeable][:article_id]),
                                                                :like_status => params[:likeable][:like_status]}
  end

end
