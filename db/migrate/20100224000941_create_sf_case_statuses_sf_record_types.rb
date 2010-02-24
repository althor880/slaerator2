class CreateSfCaseStatusesSfRecordTypes < ActiveRecord::Migration
  def self.up
    create_table "sf_case_statuses_sf_record_types", :id => false do |t|
      t.column "sf_case_status_id", :integer
      t.column "sf_record_type_id", :integer
    end
    add_index "sf_case_statuses_sf_record_types", "sf_record_type_id"
    add_index "sf_case_statuses_sf_record_types", "sf_case_status_id"
  end

  def self.down
    drop_table "sf_case_statuses_sf_record_types"
  end
end
