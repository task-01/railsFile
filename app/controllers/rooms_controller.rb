class RoomsController < ApplicationController
  # before_action :authenticate_user!, except: :show
  # before_action :permit_params, except: :new
  def register
    @room = Room.find(params[:id])
    @user = current_user.id
    @register = Register.new
  end
  def index
    @registers = Register.all
    @user = current_user.id
  end
  def new
    @user = current_user.id
    # @user = User.find(params[:id])
    @room = Room.new
  end
  def create
    @room = Room.new(params.require(:room).permit(:roomName, :user_id, :roomIntroduction, :roomMoney, :roomAddress, :image, :email, :encrypted_password ))
    if @room.save!
      redirect_to registers_register_path(id: @room.id)
    else 
      flash[:notice] = "失敗"
      @user = User.find_by(params[:user_id])
    end
  end

  def edit
    @rooms = Room.all
  end
  before_action :set_q, only: [:show, :search, :register]
  def show
    @room = Room.find(params[:id])
  end
  def search
    @results = @q.result
  end
  private

  def set_q
    @q = Room.ransack(params[:q])
  end
end
