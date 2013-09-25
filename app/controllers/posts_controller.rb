class PostsController < ApplicationController
  before_filter :check_login
  before_filter :check_admin
  def index
    @categories = Category.find(:all)
    @posts = current_user.posts.all(:order => (params[:sort]))
    @users = User.find(:all)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:post => @post)
    @offer = Offer.new(:post => @post)
    @posts = Post.title_like(@post.title)
  end

  def new
    @post = Post.new
  end

  def create
      @post = Post.new(params[:post])
      @post.user = current_user
      if @post.save
        flash[:notice] = "Post successfull created"
        redirect_to posts_path
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
        redirect_to posts_path
      else
        render :action => "edit"
      end    
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post successfully destroyed"
    redirect_to posts_path
  end  
  
  def check_login
    redirect_to root_url if current_user.blank? and flash[:notice] = "Sorry you must loged in or signup"
  end

  def check_admin
    redirect_to admin_url and return if current_user && current_user.role == "admin"
  end
end
