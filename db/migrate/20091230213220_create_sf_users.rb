class CreateSfUsers < ActiveRecord::Migration
  def self.up
    create_table :sf_users do |t|
      t.integer :sf_user_id
      t.string :email
      t.string :first_name
      t.string :sfid
      t.string :last_name
      t.string :username
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sf_users
  end
end
