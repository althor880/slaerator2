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
    @user_found = Salesforce::User.find_by_name(@sf_user.name)
    if @user_found
      @sf_user.email = @user_found.email
      @sf_user.first_name = @user_found.first_name
      @sf_user.last_name = @user_found.last_name
      @sf_user.sfid = @user_found.id
      @sf_user.username = @user_found.username
      if @sf_user.save
        flash[:notice] = "Successfully created sf user."
        redirect_to @sf_user
      else
        flash[:notice] = "User found, but error encountered when trying to save."
        render :action => 'new'
      end
    else
      flash[:notice] = "No user found with that name, must be in format 'First Last'"
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
