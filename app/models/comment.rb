class Comment < ActiveRecord::Base
  #ASSOCIATIONS
  #
  belongs_to :article

  #VALIDATIONS
  #
  validates_presence_of [:email, :body], :message => "is required"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  #INSTANCE METHODS
  #

  #Delete the comment if the article is owned by the author
  #
  def delete_by_author(author)
    case author
      when Author
        author
      when String, Integer
        author = Author.find(author)
    else
      raise "Invalid Author Parameter"
    end
    delete if article(true).author(true) == author
  end

end
