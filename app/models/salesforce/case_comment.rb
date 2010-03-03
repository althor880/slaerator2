class Salesforce::CaseComment < ActiveRecord::Base
  establish_connection "sf_production"
end
