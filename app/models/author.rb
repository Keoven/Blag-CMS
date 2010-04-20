class Author < ActiveRecord::Base
  has_many :articles
  validates_presence_of [:last_name, :first_name, :login, :email, :password], :message => "is required."
  validates_uniqueness_of :login, :message => "username already taken."
  validates_uniqueness_of :email, :message => "email already used in another account."


  acts_as_authentic

  def full_name
    first_name + " " + last_name
  end
end
