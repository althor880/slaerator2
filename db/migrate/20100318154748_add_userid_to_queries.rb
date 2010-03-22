class AddUseridToQueries < ActiveRecord::Migration
  def self.up
    add_column :queries, :user_id, :integer, :default => 1
  end

  def self.down
    remove_column :queries, :user_id
  end
end
