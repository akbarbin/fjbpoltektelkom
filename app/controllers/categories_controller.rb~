class CategoriesController < ApplicationController
  before_filter :check_user, :except => [:show]
  
  def show
    @posts = Post.all
    @categories = Category.all(:order => "name")
    @category = Category.find(params[:id])
  end
  
  def check_user
    redirect_to root_url if current_user || current_user.blank?
  end
end
