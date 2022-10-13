class UsersController < ApplicationController
  def show
    @users=User.all
    @user= User.find(params[:id])
    
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users= User.all
    @user= current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
     redirect_to user_url(@user)
    else
     render user_path(@user.id)
    end
  end
  
    private

  def users_params
    params.require(:user).permit(:name, :image, :profile)
  end
end
