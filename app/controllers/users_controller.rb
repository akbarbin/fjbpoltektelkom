class UsersController < ApplicationController
  before_filter :check_signup, :except => [:show, :edit, :update]
  before_filter :check_login, :only => [:show]
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
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      flash[:notice] = "Failed updated profile."
      render :action => 'edit'
    end
  end

  def check_login
    redirect_to root_url if current_user.blank? and flash[:notice] = "Sorry you must loged in or signup"
  end
  
  def check_signup
    redirect_to root_url if current_user
  end
end
