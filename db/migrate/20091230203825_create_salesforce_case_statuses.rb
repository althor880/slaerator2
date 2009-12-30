class CreateSalesforceCaseStatuses < ActiveRecord::Migration
  def self.up
    create_table :salesforce_case_statuses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :salesforce_case_statuses
  end
end
