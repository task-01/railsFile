class RegistersController < ApplicationController
  before_action :set_q, only: [:index, :search, :register, :confirmation, :complete, :show, :create]
  def confirmation
    @room = Room.find(params[:id])
    @user = current_user.id
    @register = Register.new(params.require(:register).permit(:roomName, :user_id, :roomIntroduction, :roomMoney, :roomAddress, :registerImage, :end_date, :start_date, :number, :room_id ))
    render("rooms/register") if @register.invalid?
	end
  def create
    @user = current_user.id
    @register = Register.new(params.require(:register).permit(:roomName, :user_id, :roomIntroduction, :roomMoney, :roomAddress, :registerImage, :end_date, :start_date, :number, :room_id ))
    if @register.save
      redirect_to registers_show_path(id: @register.id) 
    else 
      flash[:notice] = "失敗"
       redirect_to rooms_register_path(id: @register.room.id)
    end
    # binding.pry
  end
  def index 
    # binding.pry
    # @room = Room.find(params[:id])
    @registers = Register.all.order(created_at: :desc) 
    # binding.pry
    @user = current_user.id
  end
  def show
    # binding.pry
    @user = current_user.id
    @register = Register.find(params[:id])
  end
  def complete
    # binding.pry
    @user = current_user.id
    @register = Register.find(params[:id])
  end
  private
  def register_params
    @user = current_user.id
    params.require(:register).permit(:roomName, :user_id, :roomIntroduction, :roomMoney, :roomAddress, :registerImage, :email, :end_date, :start_date, :number)
  end
  def search
    @results = @q.result
    # @user = current_user.id
  end
  private

  def set_q
    @q = Room.ransack(params[:q])
  end
end
