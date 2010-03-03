class Salesforce::CaseStatus < ActiveRecord::Base
  establish_connection "sf_#{RAILS_ENV}"
end
