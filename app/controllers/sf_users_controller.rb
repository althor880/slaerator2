class SfUsersController < ApplicationController
  def index
    @sf_users = SfUser.all
  end
  
  def show
    @sf_user = SfUser.find(params[:id])
  end
  
  def new
    @sf_user = SfUser.new
  end
  
  def create
    @sf_user = SfUser.new(params[:sf_user])
    if @sf_user.save
      flash[:notice] = "Successfully created sf user."
      redirect_to @sf_user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @sf_user = SfUser.find(params[:id])
  end
  
  def update
    @sf_user = SfUser.find(params[:id])
    if @sf_user.update_attributes(params[:sf_user])
      flash[:notice] = "Successfully updated sf user."
      redirect_to @sf_user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @sf_user = SfUser.find(params[:id])
    @sf_user.destroy
    flash[:notice] = "Successfully destroyed sf user."
    redirect_to sf_users_url
  end
end
