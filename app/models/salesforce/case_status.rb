class Salesforce::CaseStatus < ActiveRecord::Base
  establish_connection "sf_production"
end
