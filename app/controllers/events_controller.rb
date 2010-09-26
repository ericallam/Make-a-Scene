class EventsController < ApplicationController
  
  before_filter :find_event
  
  def show
  end

 def post_photo_to_facebook
    @photo = @event.photos.find params[:photo_id]

    facebook_uploader = FacebookUploader.new(@photo.image.url(:big), current_facebook_user)
    facebook_uploader.upload

    render :nothing => true
  end
  
  private
  
  def find_event
    @event = Event.find_by_param params[:id]
  end

end
