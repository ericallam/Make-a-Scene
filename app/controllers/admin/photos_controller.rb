class Admin::PhotosController < ApplicationController
  before_filter :load_event
  
  def index
    @photos = @event.photos.paginate :page => params[:page] || 1
  end

  def destroy
    @photo = @event.photos.find params[:id]
    @photo.destroy
    
    redirect_to admin_event_photos_path(@event), :notice => 'Successfully deleted the photo.'
  end
  
  private
  
  def load_event
    @event = Event.find_by_param params[:event_id]
  end

end
