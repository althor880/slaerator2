class BusinessHour < ActiveRecord::Base
  attr_accessible :weekday, :workday, :start_day_hour, :start_day_minute, :end_day_hour, :end_day_minute
end
