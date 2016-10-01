class QueriesController < ApplicationController

  # GET /queries/top_titles
  def top_titles
    @books = Book.top_titles
  end

  # GET /queries/top_contributors
  def top_contributors
    @users = User.top_contributors
  end

  # GET /queries/top_exchanged_books
  def top_exchanged_books
    @books = Book.top_exchanged_books
  end

  # GET /queries/top_authors
  def top_authors
    @authors = Author.top_authors
  end

end
