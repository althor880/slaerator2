class CreateSfRecordTypesSfStatuses < ActiveRecord::Migration
  def self.up
    create_table "sf_record_types_sf_statuses", :id => false do |t|
      t.column "sf_record_type_id", :integer
      t.column "sf_status_id", :integer
    end
    add_index "sf_record_types_sf_statuses", "sf_record_type_id"
    add_index "sf_record_types_sf_statuses", "sf_status_id"
  end

  def self.down
    drop_table "sf_record_types_sf_statuses"
  end
end
