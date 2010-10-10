class Admin::EventsController < Admin::ResourcesController
  
  def preview
    @event = Event.find params[:id]
    render :action => 'events/show', :layout => 'application'
  end

  def view_public
    @event = Event.find params[:id]

    redirect_to event_path(@event)
  end
end
