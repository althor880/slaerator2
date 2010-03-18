class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :id
  has_many :queries
  acts_as_authentic
end
