require 'test_helper'

class CommentTestDeletion < ActiveSupport::TestCase
  def setup
    @author = authors(:one)
    @author2 = authors(:two)
    @article = articles(:one)
    @comment = comments(:one)
  end

  def teardown
    @author.destroy
    @author2.destroy
    @article.destroy
    @comment.destroy
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
