class SfRecordType < ActiveRecord::Base
  set_primary_key :sf_record_type_id
  attr_accessible :sf_record_type_id, :name, :sfid, :active, :sla, :description
  has_and_belongs_to_many :queries
  has_and_belongs_to_many :sf_statuses
  has_many :sla_rules

  def record_name

    "#{name}"

  end
end
