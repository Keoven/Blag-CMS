require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @a = Author.new(:first_name => 'Nelvin', :last_name => 'Driz')
    @a_no_first_name = Author.new(:first_name => '')
    @a_no_last_name = Author.new(:last_name => '')
    @a_no_login = Author.new(:login => '')
    @a_no_password = Author.new(:password => '')
    @a_no_email = Author.new(:email => '')
  end

  def teardown
    @a.destroy
    @a_no_first_name.destroy
    @a_no_last_name.destroy
    @a_no_login.destroy
    @a_no_password.destroy
    @a_no_email.destroy
  end

  test 'should have many articles' do
    assert_equal Array, @a.articles.class
  end

  test 'should have an error on email if blank' do
    assert_equal false, @a_no_email.save
    assert @a_no_email.errors.invalid?(:login)
  end

  test 'should have an error on login if blank' do
    assert_equal false, @a_no_login.save
    assert @a_no_login.errors.invalid?(:login)
  end

  test 'should have an error on password if blank' do
    assert_equal false, @a_no_password.save
    assert @a_no_password.errors.invalid?(:password)
  end

  test 'should have an error on first name if blank' do
    assert_equal false, @a_no_first_name.save
    assert @a_no_first_name.errors.invalid?(:first_name)
  end

  test 'should have an error on last name if blank' do
    assert_equal false, @a_no_last_name.save
    assert @a_no_last_name.errors.invalid?(:last_name)
  end

  test 'should return full name of author' do
    assert_equal 'Nelvin Driz', @a.send(:full_name)
  end

end
