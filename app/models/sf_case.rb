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

    @record_type_name = get_record_type_name(@thiscase)
  
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

    @sladeadline = getsladeadline(@record_type_name, @status, @priority, @slastart, @firstcontact)

    @casetimeline.each do |thisevent|

      if thisevent.class.to_s == "Salesforce::CaseHistory"

        if thisevent.field.downcase == "priority"

          @slacheck << {:event => "Priority", :slacheck => nil}
          @priority = thisevent.new_value
          @sladeadline = getsladeadline(@record_type_name, @status, @priority, @slastart, @firstcontact)

        elsif thisevent.field.downcase == "status"

          @slacheck << {:event => "Status", :slacheck => nil}
          @status = thisevent.new_value
          @sladeadline = getsladeadline(@record_type_name, @status, @priority, @slastart, @firstcontact)

        elsif thisevent.field.downcase == "recordtype"

          @slacheck << {:event => "RecordType", :slacheck => nil}

        elsif thisevent.field.downcase == "closed"

          @slacheck << {:event => "Closed", :slacheck => slavalue(thisevent.created_date, @sladeadline)}

        elsif thisevent.field.downcase == "created"

          @slacheck << {:event => "Created", :slacheck => nil}
          @slastart = thisevent.created_date
          @sladeadline = getsladeadline(@record_type_name, @status, @priority, @slastart, @firstcontact)

        else

          @slacheck << {:event => "Unknown", :slacheck => nil, :field => thisevent.field.downcase}

        end

      elsif thisevent.class.to_s == "Salesforce::CaseComment"

        @slacheck << {:event => "Contact", :slacheck => slavalue(thisevent.created_date, @sladeadline)}
        @slastart = thisevent.created_date
        if @firstcontact == false

          @firstcontact = true

        end
        @sladeadline = getsladeadline(@record_type_name, @status, @priority, @slastart, @firstcontact)

      else

        logger.info "Error! Unrecognized event class!!"

      end 

    end

    logger.info "First contact made?: #{@firstcontact}"
    logger.info "Case slastart: #{@slastart}"
    logger.info "Case sladeadline: #{@sladeadline}"
    logger.info "Case end status: #{@status}"

    logger.info "Case Ending Priority: #{@thiscase.priority}"

    @slacheck.each do |slac|
      logger.info "SLA Entry: Event - #{slac[:event]}, Value - #{slac[:slacheck]}"
    end

    if @slacheck.find {|slaentry| slaentry[:slacheck] == false}
      return false
    else
      return true
    end


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

  def getsladeadline(record_type_name, status, priority, slastart, firstcontact)

    @slarule = SlaRule.find(:first, :conditions => { :sf_record_types => { :name => record_type_name }, :sf_case_priorities => { :name => priority }, :sf_case_statuses => { :name => status }, :first_contact => firstcontact}, :joins => [:sf_record_type, :sf_case_priority, :sf_case_status])

    if @slarule
      @increment_by = @slarule.increment_by
      @ignore_bh = @slarule.ignore_business_hours
    else
      @increment_by = 0
      @ignore_bh = false
    end
     
    if @increment_by != 0
      if firstcontact && !@ignore_bh
        to_business_hours(slastart + @increment_by.minutes)
      else
        slastart + @increment_by.minutes
      end
    else
      slastart + 10.years
    end

  end

  def to_business_hours(deadline)
    @dead_day = deadline.wday
    @dead_hour = deadline.hour
    @dead_minute = deadline.min

    @bh = BusinessHour.find_by_weekday(deadline.wday)
    
    if !(@bh.workday)
      until @bh.workday
        deadline += 1.day
        @bh = BusinessHour.find_by_weekday(deadline.wday)
      end
    end

    @new_deadline = Time.zone.local(deadline.year, deadline.month, deadline.day, @bh.end_day_hour, @bh.end_day_minute, 0)

    logger.info "Deadline changed to: #{@new_deadline}"

    @new_deadline
  end

  def get_record_type_name(thiscase)
    thiscase.record_type.name
  end

end
