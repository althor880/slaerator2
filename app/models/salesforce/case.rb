class Salesforce::Case < ActiveRecord::Base
  establish_connection "sf_production"

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
