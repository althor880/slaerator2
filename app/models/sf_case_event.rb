class SfCaseEvent < ActiveRecord::Base
  belongs_to :sf_case
  belongs_to :sf_case_priority
  belongs_to :sf_case_status
end
