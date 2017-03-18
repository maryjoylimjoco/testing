class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = 'Book has successfully been created.'
      redirect_to books_path
    else
      flash[:danger] = 'There are some errors.'
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :price)
  end
end
