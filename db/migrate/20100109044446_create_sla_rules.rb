class CreateSlaRules < ActiveRecord::Migration
  def self.up
    create_table :sla_rules do |t|
      t.string :RecordTypeId
      t.string :CaseStatusId
      t.string :CasePriority
      t.integer :TimeInterval

      t.timestamps
    end
  end

  def self.down
    drop_table :sla_rules
  end
end
