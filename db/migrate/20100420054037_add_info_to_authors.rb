class AddInfoToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :login, :string, :null => false
    add_column :authors, :email, :string, :null => false
    add_column :authors, :crypted_password, :string, :null => false
    add_column :authors, :password_salt, :string, :null => false
    add_column :authors, :persistence_token, :string, :null => false
    add_column :authors, :single_access_token, :string, :null => false
    add_column :authors, :perishable_token, :string, :null => false
  end

  def self.down
    remove_columns :authors, [:login, :email, :crypted_password, :password_salt, :persistence_token, :single_access_token, :perishable_token]
  end
end
