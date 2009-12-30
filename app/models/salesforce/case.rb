class Salesforce::Case < ActiveRecord::Base
  establish_connection "sf_development"
end
