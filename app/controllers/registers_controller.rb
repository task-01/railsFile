class RegistersController < ApplicationController
  before_action :set_q, only: [:index, :search, :register, :confirmation, :complete, :show]
  def confirmation
    @user = current_user.id
    # binding.pry
    @register = Register.new(params.require(:register).permit(:roomName, :user_id, :roomIntroduction, :roomMoney, :roomAddress, :registerImage, :end_date, :start_date, :number, :room_id ))
    # binding.pry
    render confirmation_path(id: @register.id) if @register.invalid?
	end
  def create
    @user = current_user.id
    @register = Register.new(params.require(:register).permit(:roomName, :user_id, :roomIntroduction, :roomMoney, :roomAddress, :registerImage, :end_date, :start_date, :number, :room_id ))
    @register.save
    # binding.pry
    redirect_to registers_show_path(id: @register.id) 
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
    @user = current_user.id
  end
  private

  def set_q
    @q = Room.ransack(params[:q])
  end
end
