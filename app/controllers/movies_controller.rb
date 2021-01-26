class MoviesController < ApplicationController
  before_action :find_genre, only: [:index, :new, :create]
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  layout "movies_layout"

  def index
    if @genre
      @movies = @genre.movies
    else
      @movies = Movie.all
    end
  end

  def show
  end

  def new
    if @genre
      @movie = @genre.movies.build
      render :new_genre_movie
    else
      @movie = Movie.new
    end
  end
  
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      # what to do if it's valid
      if @genre
        redirect_to genre_movies_path(@genre)
      else
        redirect_to movies_path
      end
    else
      # what to do if it's not valid
      flash.now[:error] = @movie.errors.full_messages

      if @genre
        render :new_genre_movie
      else
        render :new
      end
    end
  end
  
  def edit
  end
  
  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      flash.now[:error] = @movie.errors.full_messages
      render :edit
    end
  end

  def destroy
    @movie.destroy
    flash[:notice] = "#{@movie.title} was deleted."
    redirect_to movies_path
  end
  
  private

    def find_movie
      @movie = Movie.find_by_id(params[:id])
    end

    def find_genre
      if params[:genre_id]
        @genre = Genre.find_by_id(params[:genre_id])
      end
    end

    def movie_params
      params.require(:movie).permit(
        :title,
        :genre_id,
        :release_date,
        genre_attributes: [:name]
      )
    end
end
