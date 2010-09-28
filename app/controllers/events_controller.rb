class EventsController < ApplicationController
  
  before_filter :find_event
  before_filter :authorize_event, :except => [:authenticate, :attempt_authorize]
  
  def show
    if current_facebook_user and current_facebook_user['uid']
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

  def authenticate
    
  end

  def attempt_authorize
    session[:authorized_events] ||= {}
    session[:authorized_events][@event.id] = params[:password]

    redirect_to event_path(@event)
  end
  
  private
  
  def find_event
    @event = Event.live.find_by_param params[:id]
  end

  def authorize_event
    if @event.private?
      authorized_events = session[:authorized_events] || {}
      if authorized_password = authorized_events[@event.id]
        if authorized_password != @event.password
          redirect_to authenticate_event_path(@event), :error => 'Sorry, you entered the wrong password.  Please try again.'
        end
      else
        redirect_to authenticate_event_path(@event), :error => 'You must enter the secret password to view this album'
      end
    end
  end

end
