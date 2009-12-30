class Query < ActiveRecord::Base
  attr_accessible :query_id, :startdate, :enddate, :closed, :lastrun
end
