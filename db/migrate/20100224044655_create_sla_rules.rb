class CreateSlaRules < ActiveRecord::Migration
  def self.up
    create_table :sla_rules do |t|
      t.integer :sf_record_type_id
      t.integer :sf_case_priority_id
      t.integer :sf_case_status_id
      t.boolean :first_contact
      t.integer :increment_by
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sla_rules
  end
end
