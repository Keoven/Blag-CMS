class DropLikeable < ActiveRecord::Migration
  def self.up
    drop_table :likeable
  end

  def self.down
    create_table :likeable do |t|
      t.integer :author_id
      t.integer :article_id
      t.integer :like_status

      t.timestamps
    end
  end
end
