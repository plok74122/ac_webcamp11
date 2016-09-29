class EventAttendeesController < ApplicationController
  before_action :set_event

  def index
    @attendees = @event.attendees
  end

  def show
    @attendee = @event.attendees.find(params[:id])
  end

  def new
    @attendee = @event.attendees.build
  end

  def create
    @attendee = @event.attendees.build(params_attendee)
    if @attendee.save
      flash[:notice] = "新增成功"
      redirect_to event_attendees_path(@event)
    else
      render :action => :new
    end
  end

  def edit
    @attendee = @event.attendees.find(params[:id])
  end

  def update
    @attendee = @event.attendees.find(params[:id])
    if @attendee.update(params_attendee)
      flash[:notice] = "更新成功"
      redirect_to event_attendees_path(@event)
    else
      render :action => :edit
    end
  end

  def destroy
    @attendee = @event.attendees.find(params[:id])
    @attendee.destroy
    flash[:notice] = "刪除成功"
    redirect_to event_attendees_path(@event)
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def params_attendee
    params.require(:attendee).permit(:name)
  end
end
