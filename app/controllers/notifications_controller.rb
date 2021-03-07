class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.where(checked: false)
  end

  def update
    notification=Notification.find(params[:id])
    if notification.update(checked: true)
      redirect_to action: :index
    end
  end
end
