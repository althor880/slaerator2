class SfCaseStatus < ActiveRecord::Base
  has_and_belongs_to_many :sf_record_types
  has_many :sla_rules
end
