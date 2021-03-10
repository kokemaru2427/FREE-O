class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @notifications = current_user.passive_notifications.where(checked: false)
  end

  def update
    notifications=Notification.where(visitor_id: params[:visitor_id])
    if notifications.update_all(checked: true)
      hobby = Invite.where(user_id: params[:visitor_id]).map(&:room_id)
      current = Invite.where(user_id: current_user).map(&:room_id)
      set = hobby & current
      roomset = Room.find(set[0])
      redirect_to room_path(roomset.id) 
    end
  end
end
