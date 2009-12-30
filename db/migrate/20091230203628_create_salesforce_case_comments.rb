class CreateSalesforceCaseComments < ActiveRecord::Migration
  def self.up
    create_table :salesforce_case_comments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :salesforce_case_comments
  end
end
