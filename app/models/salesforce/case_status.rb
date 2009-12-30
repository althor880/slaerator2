class Salesforce::CaseStatus < ActiveRecord::Base
  establish_connection "sf_development"
end
