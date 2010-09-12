class EventsController < ApplicationController
  
  before_filter :find_event
  
  def show
  end
  
  private
  
  def find_event
    @event = Event.find_by_param params[:id]
  end

end
