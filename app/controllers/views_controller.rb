class ViewsController < ApplicationController

  # GET /views/book_info
  def books_info
    @books = Book.books_info
  end

  # GET /views/book_owners
  def book_owners
    @books = Book.book_owners
  end

end
