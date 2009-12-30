class CreateSfUsers < ActiveRecord::Migration
  def self.up
    create_table :sf_users, :primary_key => :sf_user_id do |t|
      t.integer :sf_user_id,	:null => false
      t.string :email
      t.string :first_name
      t.string :sfid, 		:null => false
      t.string :last_name
      t.string :username
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sf_users
  end
end
