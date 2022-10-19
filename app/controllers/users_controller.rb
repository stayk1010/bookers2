class UsersController < ApplicationController
  # before_action :correct_user, only: [:edit, :update]
  def show

    @user= User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def index
    @users= User.all
    @user= current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
       flash[:notice] ='You have updated user successfully.'
       redirect_to user_path
    else
     render :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end
  # def correct_user
  #   @book = Book.find(params[:id])
  #   @user = @book.user
  #   redirect_to(books_path) unless @user == current_user
  # end
end
