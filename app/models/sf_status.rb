class SfStatus < ActiveRecord::Base
  has_and_belongs_to_many :sf_record_types
end
