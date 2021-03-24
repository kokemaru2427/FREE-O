class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_entry, only: [:index, :new, :create]
  before_action :move_to_show_event, only: [:new]

  def index
  end

  def new
    @entry = Entry.new
  end

  def create
      entry = Entry.new(entry_params)
    if entry.valid?
      entry.save
    else
      @entry = Entry.new(entry_params)
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:family_name, :last_name, :j_family_name, :j_last_name, :entry_comment, :entry_undergraduate, :entry_school_year, :entry_student_nunber,:sex).merge(user_id: current_user.id, event_id: params[:event_id])
  end

  def set_entry
    @event = Event.find(params[:event_id])
  end

  def move_to_show_event
    if current_user.id == @event.user_id
      redirect_to event_path(@event), alert: '不正なアクセスです。'
    end
  end
end
