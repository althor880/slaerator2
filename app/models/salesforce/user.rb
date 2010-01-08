class Salesforce::User < ActiveRecord::Base
  establish_connection "sf_development"
  has_many :cases, :class_name => 'Salesforce::Case', :foreign_key => 'owner_id'
end
