class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = Event.all
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
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: '不正なアクセスです'
    end
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
    redirect_to user_path(@user), notice: '更新に成功しました'
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :profile_image)
  end
end
