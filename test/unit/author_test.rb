require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  setup do
    @@a = Author.create(:last_name => "Driz", :first_name => "Nelvin")
    @@a_no_first_name = Author.new(:last_name => "Kristoff")
    @@a_no_last_name = Author.new(:first_name => "Aziel")
  end

  test "should have many articles" do
    assert_equal Array, @@a.articles.class
  end

  test "should validate the presence of last_name" do
    assert_equal false, @@a_no_last_name.save
  end

  test "should validate the presence of first_name" do
    assert_equal false, @@a_no_first_name.save
  end
  
  teardown do
  end
end
