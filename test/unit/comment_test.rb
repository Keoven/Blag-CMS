require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @@c = Comment.create(:email => "send@email.com", :body => "Hello")
    @@c_no_email = Comment.new(:body => "World")
    @@c_no_body = Comment.new(:email => "connect@here.com")
  end

  test "should belong to an article" do
    assert(@@c.respond_to? :article)
  end

  test "should validate the presence of email" do
    assert_equal false, @@c_no_email.save
  end

  test "should validate the presence of body" do
    assert_equal false, @@c_no_body.save
  end  

  teardown do
  end
end
