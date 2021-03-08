class EntriesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
  end

  def new
    @event = Event.find(params[:event_id])
    @entry = Entry.new
  end

  def create
    @event = Event.find(params[:event_id])
      entry = Entry.new(entry_params)
    if entry.valid?
      entry.save
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:family_name, :last_name, :j_family_name, :j_last_name, :entry_comment, :entry_undergraduate, :entry_school_year, :entry_student_nunber,:sex).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
