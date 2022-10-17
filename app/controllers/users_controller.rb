class UsersController < ApplicationController
  def show
    @users=User.all
    @user= User.find(params[:id])
    @books = @user.books
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
       flash[:notice] ='You have updated user successfully.'
       redirect_to user_url(@user)
    else
       render :edit
    end
  end
  
    private

  def users_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end
end
