class Admin::UsersController < ApplicationController
  before_filter :check_user, :except => [:show]
  
  def index
    @users = User.all(:conditions => "username != 'admin'", :order => "created_at")
  end  

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
  @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to admin_users_url
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to admin_users_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted profile."  
    redirect_to admin_users_path
  end

   def check_user
    redirect_to root_url and return if current_user && current_user.role != "admin"
    redirect_to admin_login_url if current_user.blank?
  end
end
