class Salesforce::Case < ActiveRecord::Base
  establish_connection "sf_development"

  def owner_name
    SfUser.find_by_sfid(owner_id).name
  end
end
