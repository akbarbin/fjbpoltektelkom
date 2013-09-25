class OffersController < ApplicationController
  
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params[:offer])
    if @offer.save
      flash[:notice] = "Offer successfully created."
      redirect_to post_path(@offer.post_id)
    else
      render :action => "new"
    end    
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update_attributes(params[:offer])
      flash[:notice] = "Offer successfully updated."
      redirect_to post_path(@offer.post_id)
    else
      render :action => "edit"
    end    
  end

  def destroy
    Offer.find(params[:id]).destroy
    flash[:notice] = "Offer successfully destroyed."
    redirect_to post_path(@offer.post_id)
  end
end
