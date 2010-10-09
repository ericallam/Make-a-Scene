class Admin::EventsController < Admin::ResourcesController
  
  def preview
    @event = Event.find params[:id]
    render :action => 'events/show', :layout => 'application'
  end
end
