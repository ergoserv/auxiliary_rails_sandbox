class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
    book_form = BookForm.call(book_params)
    if book_form.success?
      redirect_to books_path(book_form.book) and return
    else
      @errors = book_form.errors
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :publishing_year, :publisher_name)
  end
end
