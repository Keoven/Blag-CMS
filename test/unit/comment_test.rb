require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @c = Comment.create(:email => 'send@email.com', :body => 'Hello')
    @c_no_email = Comment.new(:body => 'World')
    @c_no_body = Comment.new(:email => 'connect@here.com')
    @c_with_invalid_email = Comment.new(:email => 'asdf', :body => 'Body')
  end

  test 'should belong to an article' do
    assert(@c.respond_to? :article)
  end

  test 'should fail validation due to absence of email' do
    assert_equal false, @c_no_email.save
  end

  test 'should fail validation due to the absence of the body' do
    assert_equal false, @c_no_body.save
  end

  test 'should fail validation due to invalid email' do
    assert_equal false, @c_with_invalid_email.save
  end

  def teardown
    @c.destroy
    @c_no_email.destroy
    @c_no_body.destroy
  end
end
