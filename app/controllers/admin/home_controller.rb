class Admin::HomeController < ApplicationController
  before_filter :check_user

  def index
    @post = Post.all
  end

  def report
    @feedbacks = Feedback.all
    @users = User.all
    @categories = Category.all
    @posts_soldout = Post.all(:conditions => "status = 'SoldOut'")
    @posts_pending = Post.all(:conditions => "status = 'Pending'" && "created_at")
    @comments = Comment.all
  end
  
  def check_user
    redirect_to root_url and return if current_user && current_user.role != "admin"
    redirect_to admin_login_url if current_user.blank?
  end
end
