require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @@a = Article.create(:title => "Book1", :body => "The Story")
    @@a_no_body = Article.new(:title => "Vook")
    @@a_no_title = Article.new(:body => "Budy")

    @@a_incomplete = Article.new(:title => "Book1", :body => "The Story")
    @@a_not_draft_or_posted = Article.new(:title => "Book1", :body => "The Story", :status => "abc")
    @@a_complete = Article.new(:title => "Book1", :body => "The Story", :status => "Draft")
  end

  test "should have many comments" do
    assert_equal Array, @@a.comments.class
  end
 
  test "should belong to an author" do
    assert(@@a.respond_to? :author)
  end
  
  test "should validate the presence of title" do
    assert_equal false, @@a_no_title.save
  end

  test "should validate the presence of body" do
    assert_equal false, @@a_no_body.save
  end

  test "should either have Draft or Posted as value" do
    assert_equal false, @@a_incomplete.save
    assert_equal false, @@a_not_draft_or_posted.save
    assert_equal true, @@a_complete.save
  end
  
  teardown do
  end

end
