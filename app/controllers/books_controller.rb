class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
  end
  
  def index
   @books = Book.all
   @book = Book.find(params[:id])
  end
  
  def show
  end
  
end
