class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  validates_presence_of [:title, :body], :message => "Title and body required."
  
  def self.statuses
    ["Draft", "Posted"]
  end

  validates_inclusion_of :status, :in => Article.statuses

  def before_save
    date_posted = DateTime.now if status.eql?("Posted")
  end

  def self.latest
    Article.find_by_status("Posted", :order => "date_posted DESC")
  end
  
  def posted?
    status == "Posted"
  end
end
