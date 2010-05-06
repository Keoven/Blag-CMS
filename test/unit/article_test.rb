require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @a = Article.create(:title => "Book1",
                        :body => "The Story")
    @a_no_body = Article.new(:title => "Vook")
    @a_no_title = Article.new(:body => "Budy")

    @a_incomplete = Article.new(:title => "Book1", 
                                :body => "The Story",
                                :author_id => "1")
    @a_not_draft_or_posted = Article.new(:title => "Book1",
                                         :body => "The Story",
                                         :status => "abc",
                                         :author_id => "1")
    @author = Author.create()
    @a_complete = Article.new(:title => "Book1",
                              :body => "The Story",
                              :status => "Draft",
                              :author => @author)
  end

  test "should have many comments" do
    assert_equal Array, @a.comments.class
  end
 
  test "should belong to an author" do
    assert(@a.respond_to? :author)
  end
  
  test "should validate the presence of title" do
    assert_equal false, @a_no_title.save
  end

  test "should validate the presence of body" do
    assert_equal false, @a_no_body.save
  end

  test "should either have Draft or Posted as value" do
    assert_equal false,          @a_incomplete.save
    assert_equal false, @a_not_draft_or_posted.save
    assert_equal true ,            @a_complete.save
    @a_complete.save
    assert_nil @a_complete.errors.on(:status)
  end

  test "should have all statuses as constant" do
    assert_equal 'Draft' , @a.class::STATUSES[0]
    assert_equal 'Posted', @a.class::STATUSES[1]
  end

  test "should retrieve recent posts" do
    @a_complete.save
    assert_equal 1, Article.recent_posts(10, "").count
  end

  test "article should be posted" do
    @a_complete.status = 'Posted'
    assert_equal true, @a_complete.posted?
  end

  test "article should be a draft" do
    assert_equal false, @a_complete.posted?
  end

  test "article date posted should not change after save" do
    @a_complete.save
    assert_nil @a_complete.date_posted
  end

  test "article date posted should change after save" do
    @a_complete.status = 'Posted'
    @a_complete.save
    assert_not_nil @a_complete.date_posted
  end
  
  def teardown
    @a.destroy
    @a_no_body.destroy
    @a_no_title.destroy

    @a_incomplete.destroy
    @a_not_draft_or_posted.destroy
    @author.destroy
    @a_complete.destroy
  end

end
