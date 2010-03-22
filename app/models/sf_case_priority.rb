class SfCasePriority < ActiveRecord::Base
  has_and_belongs_to_many :sf_record_types
  has_many :sla_rules
  has_many :sf_case_events
end
