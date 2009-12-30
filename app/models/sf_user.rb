class SfUser < ActiveRecord::Base
  set_primary_key :sf_user_id
  attr_accessible :sf_user_id, :email, :first_name, :sfid, :last_name, :username
  has_and_belongs_to_many :queries

  def name
    "#{first_name} #{last_name}"
  end
end
