class Query < ActiveRecord::Base
  set_primary_key :query_id
  attr_accessible :query_id, :startdate, :enddate, :closed, :lastrun
  has_and_belongs_to_many :sf_users

  def owner_names
    userarray = sf_users.collect { |sfu| sfu.name }
    userarray.compact.join(', ')
  end
  
end
