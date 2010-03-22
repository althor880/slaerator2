class SfStatusesController < ApplicationController
  filter_resource_access
  before_filter :require_user
  def index
    @sf_statuses = SfStatus.all
  end
  
  def show
    @sf_status = SfStatus.find(params[:id])
  end
  
  def new
    @sf_status = SfStatus.new
  end
  
  def create
    @sf_status = SfStatus.new(params[:sf_status])
    if @sf_status.save
      flash[:notice] = "Successfully created sf status."
      redirect_to @sf_status
    else
      render :action => 'new'
    end
  end
  
  def edit
    @sf_status = SfStatus.find(params[:id])
  end
  
  def update
    @sf_status = SfStatus.find(params[:id])
    if @sf_status.update_attributes(params[:sf_status])
      flash[:notice] = "Successfully updated sf status."
      redirect_to @sf_status
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @sf_status = SfStatus.find(params[:id])
    @sf_status.destroy
    flash[:notice] = "Successfully destroyed sf status."
    redirect_to sf_statuses_url
  end
end
