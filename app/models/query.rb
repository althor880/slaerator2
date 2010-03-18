class Query < ActiveRecord::Base
  set_primary_key :query_id
  attr_accessible :query_id, :startdate, :enddate, :closed, :lastrun, :user_id
  belongs_to :user
  has_and_belongs_to_many :sf_users
  has_and_belongs_to_many :sf_record_types

  def owner_names
    userarray = sf_users.collect { |sfu| sfu.name }
    userarray.compact.join(', ')
  end

  def case_types
    ctarray = sf_record_types.collect { |ct| ct.name }
    ctarray.compact.join(', ')
  end
  
end
