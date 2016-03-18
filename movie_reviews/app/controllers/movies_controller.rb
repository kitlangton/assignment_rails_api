class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @movie = Movie.new

    respond_to do |format|
      format.json { render json: @movies }
      format.html
    end
  end

  def create
    release_date = {release_date: Date.today}
    @movie = Movie.new(movie_params.merge(release_date))

    if @movie.save
      redirect_to @movie
    else
      render :index
    end
  end

  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.json { render json: @movie }
      format.html
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title)
  end

end
