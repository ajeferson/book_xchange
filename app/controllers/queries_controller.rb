class QueriesController < ApplicationController

  def top_titles
    @books = Book.top_titles
  end

end
