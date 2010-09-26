class EventsController < ApplicationController
  
  before_filter :find_event
  
  def show
    if current_facebook_user['uid']
      @photo_shares = @event.photo_shares.where('facebook_uid' => current_facebook_user['uid'])
    end
  end

  def post_photo_to_facebook
    @photo = @event.photos.find params[:photo_id]

    facebook_uploader = FacebookUploader.new(@photo.image.url(:big), current_facebook_user, current_graph)
    if facebook_uploader.upload
      @photo.photo_shares.create(:facebook_uid => current_facebook_user['uid'], :facebook_photo_url => facebook_uploader.link)
      render :json => {:link => facebook_uploader.link, :success => true}
    else
      render :json => {:success => false}
    end
  end
  
  private
  
  def find_event
    @event = Event.find_by_param params[:id]
  end

end
