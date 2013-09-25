class CommentsController < ApplicationController
  before_filter :check_user

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Comment successfully created."
      redirect_to post_path(@comment.post_id)
    else
      render :action => 'new'
    end    
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment successfully updated."
      redirect_to post_path(@comment.post_id)
    else
      render :action => 'edit'  
    end  
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "Comment successfully deleted"
    redirect_to root_url
  end

   def check_user
    redirect_to root_url if current_user.blank?
  end
end
