class SlaRule < ActiveRecord::Base
  attr_accessible :sf_record_type_id, :sf_case_priority_id, :sf_case_status_id, :first_contact, :increment_by
  belongs_to :sf_record_type
  belongs_to :sf_case_status
  belongs_to :sf_case_priority
end
