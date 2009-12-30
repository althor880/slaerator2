class CreateSalesforceCases < ActiveRecord::Migration
  def self.up
    create_table :salesforce_cases do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :salesforce_cases
  end
end
