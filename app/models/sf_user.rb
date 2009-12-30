class SfUser < ActiveRecord::Base
  attr_accessible :sf_user_id, :email, :first_name, :sfid, :last_name, :username
end
