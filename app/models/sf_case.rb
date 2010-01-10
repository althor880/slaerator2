class SfCase < ActiveRecord::Base

  def sla
    if metsla?
      "SLA Met!"
    else
      "Missed SLA!!"
    end
  end

end
