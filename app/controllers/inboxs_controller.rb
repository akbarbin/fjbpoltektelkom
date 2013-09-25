class InboxsController < ApplicationController

  def index
    @inboxes = Inbox.all
  end

  def new
    @inbox = Inbox.new
  end

  def create
      @inbox = inbox.new(params[:inbox])
      @inbox.user = current_user
      if @inbox.save
        flash[:notice] = "inbox successfull created"
        redirect_to inboxs_path
      else
        render :action => "new"
      end    
  end
end
