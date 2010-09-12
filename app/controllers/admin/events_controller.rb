class Admin::EventsController < Admin::BaseController
  
  respond_to :html
  
  before_filter :load_event, :only => [:edit, :update, :destroy, :show]
  
  def index
    @events = Event.paginate :per_page => params[:per_page] || 15, :page => params[:page] || 1
    
    respond_with @events
  end
  
  def show
    respond_with @event
  end

  def new
    @event = Event.new
    
    respond_with @event
  end

  def edit
    respond_with @event
  end

  def create
    @event = Event.create params[:event]
    
    respond_with @event, :location => admin_events_url
  end

  def update
    @event.update_attributes params[:event]
    
    respond_with @event, :location => admin_events_url
  end

  def destroy
    @event.destroy
    
    respond_with @event, :location => admin_events_url
  end
  
  private
  
  def load_event
    @event = Event.find_by_param params[:id]
  end

end
