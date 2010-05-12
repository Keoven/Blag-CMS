require 'test_helper'

class LikeableTest < ActiveSupport::TestCase
  def setup
    @like = Likeable.create(:author_id => 1, :article_id => 1, :like_status => -2)
    @l_no_author = Likeable.create(:article_id => 1, :like_status => 1)
    @l_no_article = Likeable.create(:author_id => 1, :like_status => 2)
    @l_no_like_status = Likeable.create(:author_id => 1, :article_id => 1)
  end

  def teardown
    @like.destroy
    @l_no_author.destroy
    @l_no_article.destroy
    @l_no_like_status.destroy
  end

  test 'likeable should belong to an author' do
    assert(@like.respond_to? :author)
  end

  test 'likeable should belong to an article' do
    assert(@like.respond_to? :article)
  end

  test 'should fail validation due to absence of author' do
    assert_equal false, @l_no_author.save
  end

  test 'should fail validation due to absence of article' do
    assert_equal false, @l_no_article.save
  end

  test 'should fail validation due to absence of like_status' do
    assert_equal false, @l_no_like_status.save
  end
end
