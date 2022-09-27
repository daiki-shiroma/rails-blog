class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @blogs = @user.blogs
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update 
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :blogs #削除に成功すればrootページに戻る
  end

  private

  def user_params
    params.require(:user).permit(:username, :profile, :email)
  end
end