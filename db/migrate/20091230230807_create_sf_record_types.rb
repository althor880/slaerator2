class CreateSfRecordTypes < ActiveRecord::Migration
  def self.up
    create_table :sf_record_types, :primary_key => :sf_record_type_id do |t|
      t.integer :sf_record_type_id,	:null => false
      t.string :name,		:null => false
      t.string :sfid, 		:null => false
      t.boolean :active,	:null => false, :default => true
      t.boolean :sla,		:null => false, :default => false
      t.string :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sf_record_types
  end
end
