class Admin::PhotoUploadsController < ApplicationController
  
  before_filter :load_event
  
  respond_to :html
  
  def new
    @photo_upload = @event.photo_uploads.build
    
    respond_with @photo_upload
  end
  
  def create
    @photo_upload = @event.photo_uploads.create(params[:photo_upload])
    
    respond_with @photo_upload, :location => admin_event_url(@event)
  end
  
  private
  
  def load_event
    @event = Event.find_by_param params[:event_id]
  end

end
