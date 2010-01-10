class CreateSfStatuses < ActiveRecord::Migration
  def self.up
    create_table :sf_statuses do |t|
      t.string :MasterLabel
      t.string :sfid

      t.timestamps
    end
  end

  def self.down
    drop_table :sf_statuses
  end
end
