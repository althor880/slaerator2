class Salesforce::User < ActiveRecord::Base
  establish_connection "sf_#{RAILS_ENV}"
  has_many :cases, :class_name => 'Salesforce::Case', :foreign_key => 'owner_id'
end
