class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    @book.user_id = current_user.id
      redirect_to book_path(current_book)
  end
  
  def index
   @books = Book.all
   @user= current_user
  end
  
  def show
    @book= Book.find(params[:id])
    @user= current_user
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

 
end
