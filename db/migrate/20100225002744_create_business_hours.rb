class CreateBusinessHours < ActiveRecord::Migration
  def self.up
    create_table :business_hours do |t|
      t.integer :weekday
      t.boolean :workday
      t.integer :start_day_hour
      t.integer :start_day_minute
      t.integer :end_day_hour
      t.integer :end_day_minute
      t.timestamps
    end
  end
  
  def self.down
    drop_table :business_hours
  end
end
