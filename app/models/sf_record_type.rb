class SfRecordType < ActiveRecord::Base
  set_primary_key :sf_record_type_id
  attr_accessible :sf_record_type_id, :name, :sfid, :active, :sla, :description
  has_and_belongs_to_many :queries
  has_and_belongs_to_many :sf_case_statuses
  has_and_belongs_to_many :sf_case_priorities
  has_many :sla_rules

  def record_name

    "#{name}"

  end

  def case_statuses_list
    csarray = sf_case_statuses.collect { |cs| cs.name }
    csarray.compact.join(', ')
  end

  def case_priorities_list
    cparray = sf_case_priorities.collect { |cp| cp.name }
    cparray.compact.join(', ')
  end
end
