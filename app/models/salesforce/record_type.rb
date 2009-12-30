class Salesforce::RecordType < ActiveRecord::Base
  establish_connection "sf_development"
end
