class RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    @room = Room.create
    Invite.create(room_id: @room.id, user_id: current_user.id)
    Invite.create(params.require(:invite).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Invite.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.all
      @message = Message.new
      @invites = @room.invites
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
