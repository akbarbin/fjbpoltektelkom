class HomeController < ApplicationController
  before_filter :check_admin
  
  def index
    @search = Post.search(params[:search])
    @posts = @search.all(:conditions => "status = 'Pending'").paginate :per_page => 2, :page => params[:page]
    @categories = Category.find(:all, :order => "name")
    @users = User.find(:all)
    @feedbacks = Feedback.find(:all)
  end

  def about
  end
  
  def contact
    @feedback = Feedback.all
  end

  def list
    @posts = Post.paginate(:per_page => 10, :page => params[:page])
    @categories = Category.find(:all, :order => "name")
  end

  def check_admin
    redirect_to admin_url and return if current_user && current_user.role == "admin"
  end
end
