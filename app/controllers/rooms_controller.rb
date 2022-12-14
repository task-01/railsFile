class RoomsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @room = Room.new
  end
  def create
    @room = Room.new(params.require(:room).permit(:roomName, :user_id, :roomIntroduction, :roomMoney, :roomAddress, :image, :email, :password))
    # binding.pry
    if @room.save!
      # binding.pry
      # flash[:notice] = "新規投稿をしました"
      redirect_to room_path
    else 
      flash[:notice] = "失敗"
      @user = User.find_by(params[:user_id])
    end
  end
  
end
