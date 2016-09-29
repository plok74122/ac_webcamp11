class EventsController < ApplicationController
  before_action :set_event, :only => [:show, :edit, :update, :destroy]

  def index
    @events = Event.page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.json { render :json => @events.to_json }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    if @event.save
      flash[:notice]="新增成功"
      redirect_to event_path(@event)
    else
      render :action => :new
    end
  end

  def show
    @page_title = @event.name
    respond_to do |format|
      format.html
      format.json { render :json => { :name => @event.name, :description => @event.description, :creaet_time => @event.created_at }.to_json }

    end
  end

  def edit
  end

  def update
    if @event.update(params_event)
      flash[:notice]="更新成功"
      redirect_to event_path(@event)
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy
    flash[:notice]="刪除成功"
    redirect_to events_path
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def params_event
    params.require(:event).permit(:name, :description, :capacity , :category_id)
  end
end
