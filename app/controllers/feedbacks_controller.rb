class FeedbacksController < ApplicationController
  before_filter :check_user, :except => [:new, :create, :destroy]
  
  def new
    @feedback = Feedback.new
  end
  
  def create
    @feedback = Feedback.new(params[:feedback])
      if @feedback.save
        flash[:notice] = "Successfully send"
        redirect_to root_url
      else
        render :action => 'new'
      end   
  end
  
  def destroy
    Feedback.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted"
    redirect_to admin_feedbacks_url
  end

  def check_user
    redirect_to root_url and return if current_user || current_user.blank?
  end
end
