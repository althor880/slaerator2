class SfCase < ActiveRecord::Base

  def sla
    if metsla?
      "SLA Met!"
    else
      "Missed SLA!!"
    end
  end

  def metsla?

    @thiscase = Salesforce::Case.find_by_id(sfid)
    @casecomments = @thiscase.case_comments.find(:all, :conditions => ["comment_body LIKE ?", "contact%"], :order => :CreatedDate)
    @casehistory = @thiscase.case_histories.find(:all, :conditions => { :field => ["priority", "status", "recordtype", "closed", "created"]})
    @thiscasetimeline = @casecomments.to_a + @casehistory.to_a
    @thiscasetimeline = @thiscasetimeline.sort { |a,b| a.created_date <=> b.created_date }
    
    @priority = if this = @casehistory.find { |hist| hist.field == "Priority" }.old_value
                  this
                else
                  @thiscase.priority
                end

    @slastart = @thiscase.created_date

    @status = if this = @casehistory.find { |hist| hist.field == "Status" }.old_value
                this
              else
                @thiscase.status
              end

    


    logger.info "Case slastart: #{@slastart}"
    logger.info "Case statusstart: #{@status}"
    logger.info "Case Starting Priority (@priority): #{@priority}"
    logger.info "Case Ending Priority: #{@thiscase.priority}"

    true


  end

end
