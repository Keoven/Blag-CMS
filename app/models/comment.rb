class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of [:email, :body], :message => "Email and body required"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
