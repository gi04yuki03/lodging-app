class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.valid?(:step1) && @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def reservation
    @user = current_user
    @reservations = @user.reservations
  end
  
  def posted
    @user = current_user
    @posts = @user.posts
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end

end
