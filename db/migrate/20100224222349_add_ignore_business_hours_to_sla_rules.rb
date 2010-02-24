class AddIgnoreBusinessHoursToSlaRules < ActiveRecord::Migration
  def self.up
    add_column :sla_rules, :ignore_business_hours, :boolean, :default => 0
    SlaRule.find(:all).each do |sr|
      sr.update_attribute :ignore_business_hours, 0
    end
  end

  def self.down
    remove_column :sla_rules, :ignore_business_hours
  end
end
