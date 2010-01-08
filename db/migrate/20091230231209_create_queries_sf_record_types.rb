class CreateQueriesSfRecordTypes < ActiveRecord::Migration
  def self.up
    create_table "queries_sf_record_types", :id => false do |t|
      t.column "query_id", :integer
      t.column "sf_record_type_id", :integer
    end
    add_index "queries_sf_record_types", "query_id"
    add_index "queries_sf_record_types", "sf_record_type_id"
  end

  def self.down
    drop_table "queries_sf_record_types"
  end
end
