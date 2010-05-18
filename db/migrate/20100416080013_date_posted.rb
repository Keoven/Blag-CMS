class DatePosted < ActiveRecord::Migration
  def self.up
    add_column :articles, :date_posted, :datetime
  end

  def self.down
    remove_column :articles, :date_posted
  end
end
