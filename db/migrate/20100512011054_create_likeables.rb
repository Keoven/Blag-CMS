class CreateLikeables < ActiveRecord::Migration
  def self.up
    create_table :likeables do |t|
      t.integer :author_id
      t.integer :article_id
      t.integer :like_status

      t.timestamps
    end
  end

  def self.down
    drop_table :likeables
  end
end
