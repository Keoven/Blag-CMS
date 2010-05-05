require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @author = authors(:one)
    @author2 = authors(:two)
    @article = articles(:one)
    @comment = comments(:one)
    #@controller = CommentsController.new
  end
  
  test "author should be able to delete comments on owned articles" do
    @article.author = @author
    @article.save
    @article.comments << @comment
    assert_difference '@article.comments(true).count', -1 do
      post :destroy, :id => @comment.to_param, :author_id => @author.to_param, :method => :delete    
    end
  end

  test "author should not be able to delete comment on not owned articles" do
    @article.author = @author
    @article.save
    @article.comments << @comment
    assert_no_difference '@article.comments.count' do
      delete :destroy, :id => @comment.to_param, :author_id => @author2.to_param
    end
  end
end
