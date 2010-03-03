class Salesforce::CaseHistory < ActiveRecord::Base
  establish_connection "sf_production"
end
