class Admin::CategoriesController < ApplicationController
  before_filter :check_user
  
  def index
    @categories = Category.all(:order => (params[:sort]))
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
        flash[:notice] = "Successfully created new category"
        redirect_to admin_categories_path
    else
        render :action => "new"
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated category."
      redirect_to admin_categories_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Successfully destroyed category."
    redirect_to admin_categories_path
  end

  def check_user
    redirect_to root_url and return if current_user && current_user.role != "admin"
    redirect_to admin_login_url if current_user.blank?
  end
end
