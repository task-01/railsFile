class UsersController < ApplicationController
  # before_action :authenticate_user!, except: :home
  before_action :set_q, only: [:home, :edit, :show, :index, :search, :register]
  def show
    @user = User.find(params[:id])
  end
  def register
    @user = current_user.id
    @room = Room.new
  end

  def index
    @rooms = Room.all
    @rooms.where!(user_id: current_user.id)
    @user = current_user.id
  end
  def edit
    # @room = Room.find(params[:id])
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :image, :introduction, :iconImage))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to request.referer
    else
      render "edit"
    end
  end
  def home 
    @rooms = Room.all
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
