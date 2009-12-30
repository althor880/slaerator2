class Salesforce::CaseComment < ActiveRecord::Base
  establish_connection "sf_development"
end
