class Admin::FeedbacksController < ApplicationController
  #before_filter :check_admin
  
  def index
    @feedbacks = Feedback.all
  end
  
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
      if @feedback.save
        flash[:notice] = "Successfully send"
        redirect_to admin_feedbacks_url
      else
        render :action => 'new'
      end   
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])
      if @feedback.update_attributes(params[:feedback])        
        flash[:notice] = "Feeback successfull replay"
        redirect_to admin_feedbacks_path
      else
        render :action => "edit"
      end    
  end

  def destroy
    @feedback = Feedback.find
    flash[:notice] = "Successfully deleted"
    redirect_to admin_url
  end

  def check_admin
    redirect_to root_url and return if current_user && current_user.role != "admin"
    redirect_to admin_url if current_user.blank?
  end
end
