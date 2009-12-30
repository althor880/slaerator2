class CreateQueriesSfUsers < ActiveRecord::Migration
  def self.up
    create_table "queries_sf_users", :id => false do |t|
      t.column "query_id", :integer
      t.column "sf_user_id", :integer
    end
    add_index "queries_sf_users", "query_id"
    add_index "queries_sf_users", "sf_user_id"
  end

  def self.down
    drop_table "queries_sf_users"
  end
end
