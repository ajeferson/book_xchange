class ViewsController < ApplicationController

  # GET /views/book_info
  def books_info
    @books = Book.books_info
  end

end
