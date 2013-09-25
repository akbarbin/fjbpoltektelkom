class Admin::PostsController < ApplicationController
  before_filter :check_user
  
  def index
    @posts_soldout = Post.all(:conditions => "status = 'SoldOut'")
    @posts_pending = Post.all(:conditions => "status = 'Pending'")
    @posts = Post.paginate(:per_page => 10, :page => params[:page])
    @categories = Category.find(:all)
    @users = User.find(:all)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:post => @post)
    @offer = Offer.new(:post => @post)
  end

  def new
    @post = Post.new
  end

  def create
      @post = Post.new(params[:post])
      @post.user = current_user
      if @post.save
        flash[:notice] = "Post successfull created"
        redirect_to admin_posts_path
      else
        render :action => "new"
      end    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])        
        flash[:notice] = "Post successfull updated"
        redirect_to admin_posts_path
      else
        render :action => "edit"
      end    
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post successfully destroyed"
    redirect_to admin_posts_path
  end  

   def check_user
    redirect_to root_url and return if current_user && current_user.role != "admin"
    redirect_to admin_login_url if current_user.blank?
  end
end
