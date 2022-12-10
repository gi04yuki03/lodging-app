class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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
