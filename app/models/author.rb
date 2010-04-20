class Author < ActiveRecord::Base
  has_many :articles
  validates_presence_of [:last_name, :first_name], :message => "First name and last name required."

  def full_name
    last_name + ", " + first_name
  end
end
