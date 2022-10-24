class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!
  def new
    @book = Book.new
    @books=Book.all
  end

  def create
    @book = Book.new(book_params)

    @book.user_id = current_user.id
   if @book.save
     flash[:notice] ='You have created book successfully.'
     redirect_to book_path(@book.id)
   else
     @books = Book.all
     @user= current_user
     render :index
   end
  end

  def index
   @books = Book.all
   @user= current_user
   @book= Book.new
  end

  def edit
   @book = Book.find_by(params[:id])
  end

  def show
    @book= Book.find(params[:id])
    @users= User.all
    @user = current_user
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] ='You have updated book successfully.'
      redirect_to book_path(@book)
   else
      render :edit
   end
  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end
   private
    def correct_user
      book = Book.find(params[:id])
     if current_user != book.user
      redirect_to books_path
     end
    end
end