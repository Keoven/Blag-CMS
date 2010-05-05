require 'test_helper'

class CommentTestDeletion < ActiveSupport::TestCase
  def setup
     @author = authors(:one)
     @author2 = authors(:two)
#    @author = Author.create(:first_name => "X", :last_name => "Y", :email => "a@a.com", :login => "X")
#    @author2 = Author.create(:first_name => "Y", :last_name => "x", :email => "b@b.com", :login => "Y")
    @article = articles(:one)
    @comment = comments(:one)
  end

  test "should be able to delete comment using author_id" do
    @article.author = @author
    @article.save
    @article.comments << @comment
    assert_difference '@article.comments(true).count', -1  do
      @comment.delete_by_author(@author.id)
    end
  end

  test "should be able to delete comment" do
    @article.author =  @author
    @article.save
    @article.comments << @comment
    assert_difference '@article.comments(true).count', -1  do
      @comment.delete_by_author(@author)
    end
  end

  test "should not be able to delete comment" do
    @article.author = @author
    @article.save
    @article.comments << @comment
    assert_no_difference '@article.comments.count' do
      @comment.delete_by_author(@author2)
    end
  end

  test "should not be able to delete comment using author_id" do
    @article.author = @author
    @article.save
    @article.comments << @comment
    assert_no_difference '@article.comments.count' do
      @comment.delete_by_author(@author2.id)
    end
  end
end
