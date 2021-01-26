class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

  def new
    @genre = Genre.new

    @genre.movies.build
    @genre.movies.build
    @genre.movies.build
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to movies_path
    else
      render :new
    end
  end


  private

    def genre_params
      params.require(:genre).permit(
        :name,
        movies_attributes: [:title, :release_date]
      )
    end
end
