class QueriesController < ApplicationController

  # GET /queries/top_titles
  def top_titles
    @books = Book.top_titles
  end

  # GET /queries/top_contributors
  def top_contributors
    @users = User.top_contributors
  end

end
