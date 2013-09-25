class UserSessionsController < ApplicationController
  #before_filter :check_login, :except => [:new, :create, :destroy]
  before_filter :check_user, :only => [:new]
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if current_user.role == "admin"
        @user_session.destroy    
        redirect_to root_url
      else  
        flash[:notice] = "Successfully loged in."
        redirect_to root_url
      end  
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
  
  def check_user
    if current_user
      redirect_to current_user.role == "user" ? admin_url : user_url
    end
  end
end
