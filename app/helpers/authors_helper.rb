module AuthorsHelper

  def authors_options_for_select
    authors = Author.all
    authors.map { |author| [author.name, author.cpf] }
  end

end
