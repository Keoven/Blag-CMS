class Likeable < ActiveRecord::Base
  #ASSOCIATIONS
  #
  belongs_to :author
  belongs_to :article

  #VALIDATIONS
  #
  validates_presence_of [:author, :article, :like_status], :message => 'is required.'
end
