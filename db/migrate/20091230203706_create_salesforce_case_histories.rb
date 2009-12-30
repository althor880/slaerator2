class CreateSalesforceCaseHistories < ActiveRecord::Migration
  def self.up
    create_table :salesforce_case_histories do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :salesforce_case_histories
  end
end
