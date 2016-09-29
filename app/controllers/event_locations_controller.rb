class EventLocationsController < ApplicationController
  before_action :set_event

  def new
    @location = @event.build_location
  end

  def create
    @location = @event.build_location(params_location)
    if @location.save
      flash[:notice] = "新增地點成功"
      redirect_to event_path(@event)
    else
      render :action => :new
    end
  end


  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def params_location
    params.require(:location).permit(:name)
  end
end
