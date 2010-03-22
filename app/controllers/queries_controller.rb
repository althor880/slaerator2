class QueriesController < ApplicationController
  filter_resource_access
  before_filter :require_user
  
  
  def index
    @queries = Query.find_all_by_user_id(current_user.id)
  end
  
  def show
    @query = Query.find(params[:id])
  end

  def run
    @query = Query.find(params[:id])
    @cases = Salesforce::Case.find(:all, :conditions => ["OwnerId in (:owners) AND status = 'Closed' AND ClosedDate > #{@query.startdate.to_datetime.to_s} AND ClosedDate < #{@query.enddate.to_datetime.end_of_day.to_s} AND RecordTypeId in (:recordtypes)", { :owners => @query.sf_users.collect{|sfu| sfu.sfid }, :recordtypes => @query.sf_record_types.collect{|sfrt| sfrt.sfid }}])
    @all_case_ids = ""
    @cases.each do |thiscase|
      @all_case_ids += "#{thiscase.id},"
      unless SfCase.find_by_sfid(thiscase.id)
        newsfcase = SfCase.new(:sfid => thiscase.id)
        newsfcase.save
      end
    
    end
    @all_case_ids = @all_case_ids.chomp(',')
    
  end

  def analyze

    logger.info 'analyze button pressed' 

  end

  def analyze_all

    logger.info 'analyze ALL button pressed'

  end

  def new
    @query = Query.new
  end
  
  def create
    @query = Query.new(params[:query])
    @query.sf_users = SfUser.find(params[:sf_user_ids]) if params[:sf_user_ids]
    @query.user = current_user
    @query.sf_record_types = SfRecordType.find(params[:sf_record_type_ids]) if params[:sf_record_type_ids]
    if @query.save
      flash[:notice] = "Successfully created query."
      redirect_to @query
    else
      render :action => 'new'
    end
  end
  
  def edit
    @query = Query.find(params[:id])
  end
  
  def update
    @query = Query.find(params[:id])
    @query.sf_users = SfUser.find(params[:sf_user_ids]) if params[:sf_user_ids]
    @query.sf_record_types = SfRecordType.find(params[:sf_record_type_ids]) if params[:sf_record_type_ids]
    if @query.update_attributes(params[:query])
      flash[:notice] = "Successfully updated query."
      redirect_to @query
    else
      render :action => 'edit'
    end
  end

  
  def destroy
    @query = Query.find(params[:id])
    @query.destroy
    flash[:notice] = "Successfully destroyed query."
    redirect_to queries_url
  end
end
