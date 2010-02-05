class AddFirstContactToSlaRule < ActiveRecord::Migration
  def self.up
    add_column :sla_rules, :FirstContact, :boolean
  end

  def self.down
    remove_column :sla_rules, :FirstContact
  end
end
