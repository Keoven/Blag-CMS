class Likeable < ActiveRecord::Migration
  def self.up
    create_table :likeable do |t|
      t.integer :author_id
      t.integer :article_id
      t.integer :like_status

      t.timestamps
    end
  end

  def self.down
    drop_table :likeable
  end
end
