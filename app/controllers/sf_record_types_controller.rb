class SfRecordTypesController < ApplicationController
  filter_resource_access
  before_filter :require_user
  
  def index
    @sf_record_types = SfRecordType.all
  end
  
  def show
    @sf_record_type = SfRecordType.find(params[:id])
  end
  
  def new
    @sf_record_type = SfRecordType.new
  end

  def create
    @sf_record_type = SfRecordType.new(params[:sf_record_type])
    @sfrt_found = Salesforce::RecordType.find_by_name(@sf_record_type.name)
    if @sfrt_found
      @sf_record_type.name = @sfrt_found.name
      @sf_record_type.sfid = @sfrt_found.id
      @sf_record_type.description = @sfrt_found.description
      @sf_record_type.sf_case_statuses = SfCaseStatus.find(params[:sf_case_status_ids]) if params[:sf_case_status_ids]
      @sf_record_type.sf_case_priorities = SfCasePriority.find(params[:sf_case_priority_ids]) if params[:sf_case_priority_ids]
      if @sf_record_type.save
        flash[:notice] = "Successfully created sf record type."
        redirect_to @sf_record_type
      else
        flash[:notice] = "Record type found, but error encountered when trying to save."
        render :action => 'new'
      end
    else
      flash[:notice] = "No record type found with that name, must include the exact name as displayed in SalesForce."
      render :action => 'new'
    end
  end
  
  def edit
    @sf_record_type = SfRecordType.find(params[:id])
  end
  
  def update
    @sf_record_type = SfRecordType.find(params[:id])
    @sf_record_type.sf_case_statuses = SfCaseStatus.find(params[:sf_case_status_ids]) if params[:sf_case_status_ids]
    @sf_record_type.sf_case_priorities = SfCasePriority.find(params[:sf_case_priority_ids]) if params[:sf_case_priority_ids]
    if @sf_record_type.update_attributes(params[:sf_record_type])
      flash[:notice] = "Successfully updated sf record type."
      redirect_to @sf_record_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @sf_record_type = SfRecordType.find(params[:id])
    @sf_record_type.destroy
    flash[:notice] = "Successfully destroyed sf record type."
    redirect_to sf_record_types_url
  end
end
