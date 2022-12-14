class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
end
