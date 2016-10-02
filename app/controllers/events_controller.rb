class EventsController < ApplicationController
  before_action :set_event, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:group]
      @group = Group.find_by_name(params[:group])
      @events = @group.events.page(params[:page]).per(25)
    else
      @events = Event.page(params[:page]).per(25)
    end

    if params[:order] == "name"
      @events = @events.order(:name)
    elsif params[:order] == "created_at"
      @events = @events.order(:created_at)
    end

    if params[:keyword]
      @events = @events.where("name like ?", "%#{params[:keyword]}%")
    end

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
    {:name => "111" , :description => "222"}
    @event.name = params[:event][:name]
    @event.description = params[:event][:description]

    @event.full_name = params[:event][:full_name]
    @event.user = current_user
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

  def bulk_update
    if params[:commit] == "bulk_update"
      Event.where("id in (?)", params[:ids]).update(:is_public => true)
    elsif params[:commit] == "bulk_delete"
      # Event.destroy(params[:ids])
      Event.where("id in (?)", params[:ids]).destroy_all
    end
    redirect_to events_path
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def params_event
    params.require(:event).permit(:name, :description, :capacity, :category_id, :full_name, :group_ids => [])
  end
end
