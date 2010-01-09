class CreateSfCases < ActiveRecord::Migration
  def self.up
    create_table :sf_cases do |t|
      t.string :sfid,	:null => false
      t.boolean :analyzed,	:null => false, :default => false
      t.boolean :metsla,	:default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :sf_cases
  end
end
