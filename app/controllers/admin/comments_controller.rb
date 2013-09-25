class Admin::CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Comment successfully created."
      #redirect_to admin_post_path(@comment.post_id)
      redirect_to admin_post_path
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
      #redirect_to admin_post_path(@comment.post_id)
      redirect_to admin_post_path
    else
      render :action => 'edit'  
    end  
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "Comment successfully deleted"
    redirect_to admin_post_path(@comment.post_id)
  end
end
