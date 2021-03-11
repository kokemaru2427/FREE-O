class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_index_user, only: [:edit]

  def index
    @users = User.all
  end

  def show
    @events = Event.all
    @entry_events = @user.entried_events
    @entries = Entry.all
    @currentUserInvite = Invite.where(user_id: current_user.id)
    @userInvite = Invite.where(user_id: @user.id)
    if @user.id == current_user.id
      @msg =""
    else
      @currentUserInvite.each do |cu|
        @userInvite.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      if @isRoom != true
        @room = Room.new
        @invite = Invite.new
      end

    end
  end

  def edit
  end

  def update
    if  @user.update(user_params)
      redirect_to user_path(@user), notice: '更新に成功しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :user_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index_user
    if @user != current_user
      redirect_to root_path, alert: '不正なアクセスです。'
    end
  end
end
