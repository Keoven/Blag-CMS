class Article < ActiveRecord::Base
  #CONSTANTS
  #
  STATUSES = ['Draft', 'Posted']

  #ASSOCIAIONS
  #
  belongs_to :author
  has_many :comments, :dependent => :destroy
  has_many :likeables, :dependent => :destroy
  has_many :likes, :source => :author, :through => :likeables

  #VALIDATIONS
  #
  validates_presence_of [:title, :body, :author], :message => 'is required.'
  validates_inclusion_of :status, :in => STATUSES

  #CALLBACKS
  #
  before_save :set_date_posted

  #NAMED SCOPES
  #

  #Get the <limit> most current articles with the given conditions
  #
  named_scope :recent_posts, lambda { |limit, condition|
    { :conditions => ['status LIKE "Posted" ' << condition],
      :order => 'date_posted DESC',
      :limit => limit }
  }

  #CLASS METHODS
  #

  #Get latest article posted
  #
  def self.latest
    recent_posts(1,"").first
  end

  #INSTANCE METHODS
  #
  def posted?
    status == 'Posted'
  end

  private
  #Set the date posted if the status of article is now 'Posted'
  def set_date_posted
    self.date_posted = DateTime.now if posted?
  end
end
