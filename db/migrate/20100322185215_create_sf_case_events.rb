class CreateSfCaseEvents < ActiveRecord::Migration
  def self.up
    create_table :sf_case_events do |t|
      t.timestamp :created_date
      t.string :type
      t.string :field
      t.string :old_value
      t.string :new_value
      t.boolean :slacheck
      t.boolean :first_contact
      t.integer :sf_case_priority_id
      t.integer :sf_case_status_id
      t.integer :sf_case_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sf_case_events
  end
end
