module BooksHelper

  def books_options_for_select
    books = Book.all
    books.map { |book| [book.name, book.isbn] }
  end

end
