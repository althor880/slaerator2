class Salesforce::User < ActiveRecord::Base
  establish_connection "sf_development"
end
