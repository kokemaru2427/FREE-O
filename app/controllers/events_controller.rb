class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @comments = @event.comments.includes(:user)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :details, :category_id, :event_prefecture_id, :people_number_id, :cost, :event_date, :start_time, :end_time, :event_image, :event_address).merge(user_id: current_user.id)
  end
end
