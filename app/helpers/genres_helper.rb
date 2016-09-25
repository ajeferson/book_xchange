module GenresHelper

  def genres_options_for_select
    genres = Genre.all
    genres.map { |genre| [genre.name, genre.id] }
  end

end
