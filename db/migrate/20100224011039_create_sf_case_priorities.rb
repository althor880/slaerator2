class CreateSfCasePriorities < ActiveRecord::Migration
  def self.up
    create_table :sf_case_priorities do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :sf_case_priorities
  end
end
