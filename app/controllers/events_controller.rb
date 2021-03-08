class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :search_product, only: [:index, :search]

  def index
    @events = Event.all
    @events = @p.result(distinct: true).order("created_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @entrys = Entry.all
    @comment = Comment.new
    @comments = @event.comments.includes(:user)
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to user_path(current_user.id)
  end

  def search
    @results = @p.result.order("created_at DESC")
  end

  private

  def event_params
    params.require(:event).permit(:title, :details, :category_id, :activities_category_id, :event_prefecture_id, :event_facility, :people_number_id, :cost, :event_date, :start_time, :end_time, :event_image, :event_address).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def search_product
    @p = Event.ransack(params[:q])
  end

end
