class SlaRule < ActiveRecord::Base
  attr_accessible :first_contact, :increment_by
  belongs_to :sf_record_type
end
