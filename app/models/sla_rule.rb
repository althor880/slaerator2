class SlaRule < ActiveRecord::Base
  attr_accessible :sf_record_type_id, :sf_case_priority_id, :sf_case_status_id, :first_contact, :increment_by, :ignore_business_hours
  belongs_to :sf_record_type
  belongs_to :sf_case_status
  belongs_to :sf_case_priority

  def sf_record_type_name
    sf_record_type.name
  end

  def sf_case_status_name
    sf_case_status.name
  end

  def sf_case_priority_name
    sf_case_priority.name
  end
end
