class BusinessHoursController < ApplicationController
  def index
    @business_hours = BusinessHour.all
  end
  
  def show
    @business_hour = BusinessHour.find(params[:id])
  end
  
  def new
    @business_hour = BusinessHour.new
  end
  
  def create
    @business_hour = BusinessHour.new(params[:business_hour])
    if @business_hour.save
      flash[:notice] = "Successfully created business hour."
      redirect_to @business_hour
    else
      render :action => 'new'
    end
  end
  
  def edit
    @business_hour = BusinessHour.find(params[:id])
  end
  
  def update
    @business_hour = BusinessHour.find(params[:id])
    if @business_hour.update_attributes(params[:business_hour])
      flash[:notice] = "Successfully updated business hour."
      redirect_to @business_hour
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @business_hour = BusinessHour.find(params[:id])
    @business_hour.destroy
    flash[:notice] = "Successfully destroyed business hour."
    redirect_to business_hours_url
  end
end
