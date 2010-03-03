class Salesforce::Case < ActiveRecord::Base
  establish_connection "sf_#{RAILS_ENV}"

  def owner_name
    SfUser.find_by_sfid(owner_id).name
  end

  def analyzed?
    SfCase.find_by_sfid(id).analyzed?
  end

  def metsla
    if SfCase.find_by_sfid(id).metsla?
      "SLA was met!"
    else
      "SLA was missed!"
    end
  end

end
