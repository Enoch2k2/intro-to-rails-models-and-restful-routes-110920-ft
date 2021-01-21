module MoviesHelper
  def genre_name(movie)
    if movie.genre
      movie.genre.name
    else
      link_to "Add Genre", edit_movie_path(movie)
    end
  end
end
