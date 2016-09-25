json.extract! book, :id, :pages, :isbn, :name, :publish_date, :edition, :created_at, :updated_at
json.url book_url(book, format: :json)