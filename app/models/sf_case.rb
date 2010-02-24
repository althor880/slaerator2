class SfCase < ActiveRecord::Base

  def sla
    if metsla?
      "SLA Met!"
    else
      "Missed SLA!!"
    end
  end

  def metsla?

    @slacheck = [{:event => "Start", :slacheck => true}]
    @thiscase = Salesforce::Case.find_by_id(sfid)
    @casecomments = @thiscase.case_comments.find(:all, :conditions => ["comment_body LIKE ?", "contact%"], :order => :CreatedDate)
    @casehistory = @thiscase.case_histories.find(:all, :conditions => { :field => ["priority", "status", "recordtype", "closed", "created"]})
    @casetimeline = @casecomments.to_a + @casehistory.to_a
    @casetimeline = @casetimeline.sort { |a,b| a.created_date <=> b.created_date }

    @casehistory = @casehistory.sort { |a,b| a.created_date <=> b.created_date }
  
    @priority = if @casehistory.find { |hist| hist.field == "Priority" }
                  @casehistory.find { |hist| hist.field == "Priority" }.old_value
                else
                  @thiscase.priority
                end

    logger.info "Case Starting Priority (@priority): #{@priority}"

    @slastart = @thiscase.created_date

    @status = if @casehistory.find { |hist| hist.field == "Status" }
                @casehistory.find {|hist| hist.field == "Status"}.old_value
              else
                @thiscase.status
              end

    logger.info "Case starting status (@status): #{@status}"

    @firstcontact = false

    @sladeadline = getsladeadline(@status, @priority, @slastart, @firstcontact)

    @casetimeline.each do |thisevent|

      if thisevent.class.to_s == "Salesforce::CaseHistory"

        if thisevent.field.downcase == "priority"

          @slacheck << {:event => "Priority", :slacheck => nil}
          @priority = thisevent.new_value
          @sladeadline = getsladeadline(@status, @priority, @slastart, @firstcontact)

        elsif thisevent.field.downcase == "status"

          @slacheck << {:event => "Status", :slacheck => nil}
          @status = thisevent.new_value
          @sladeadline = getsladeadline(@status, @priority, @slastart, @firstcontact)

        elsif thisevent.field.downcase == "recordtype"

          @slacheck << {:event => "RecordType", :slacheck => nil}

        elsif thisevent.field.downcase == "closed"

          @slacheck << {:event => "Closed", :slacheck => slavalue(thisevent.created_date, @sladeadline)}

        elsif thisevent.field.downcase == "created"

          @slacheck << {:event => "Created", :slacheck => nil}
          @slastart = thisevent.created_date
          @sladeadline = getsladeadline(@status, @priority, @slastart, @firstcontact)

        else

          @slacheck << {:event => "Unknown", :slacheck => nil, :field => thisevent.field.downcase}

        end

      elsif thisevent.class.to_s == "Salesforce::CaseComment"

        @slacheck << {:event => "Contact", :slacheck => slavalue(thisevent.created_date, @sladeadline)}
        @slastart = thisevent.created_date
        if @firstcontact == false

          @firstcontact = true

        end
        @sladeadline = getsladeadline(@status, @priority, @slastart, @firstcontact)

      else

        logger.info "Error! Unrecognized event class!!"

      end 

    end

    logger.info "First contact made?: #{@firstcontact}"
    logger.info "Case slastart: #{@slastart}"
    logger.info "Case sladeadline: #{@sladeadline}"
    logger.info "Case end status: #{@status}"

    logger.info "Case Ending Priority: #{@thiscase.priority}"

    true


  end

  def slavalue(slastart, sladeadline)

    difference = sladeadline - slastart
    if (difference >= 0)
      logger.info "slastart = #{slastart} sladeadline = #{sladeadline} TRUE"
      return true
    elsif (difference < 0)
      logger.info "slastart = #{slastart} sladeadline = #{sladeadline} FALSE"
      return false
    else
      logger.info "slastart = #{slastart} sladeadline = #{sladeadline} ERROR!@!! - Invalid slavalue"
      return nil
    end

  end

  def getsladeadline(status, priority, slastart, firstcontact)

    slastart + 15.minutes

  end

end