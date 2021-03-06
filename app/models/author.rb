class Author < ActiveRecord::Base
  #ASSOCIATIONS
  #
  has_many :articles, :dependent => :destroy
  has_many :likeables
  has_many :likes, :source => :article, :through => :likeables

  #PLUGINS
  #
  acts_as_authentic { |c| c.login_field = :login }

  #VALIDATIONS
  #
  validates_presence_of [:last_name, :first_name, :login, :email, :password], :message => 'is required.'
  validates_uniqueness_of :login, :message => 'username already taken.'
  validates_uniqueness_of :email, :message => 'email already used in another account.'

  #INSTANCE METHODS
  #

  #Get full name of author with format <first_name> <last_name>
  #
  private
  def full_name
    "#{first_name} #{last_name}"
  end
end
