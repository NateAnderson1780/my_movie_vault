class MoviesController < ApplicationController
  def index
    @movies = current_user.movies.all
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update 
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      flash[:error] = @movie.errors.full_messages.join(' ')
      redirect_to edit_movie_path
    end
  end
  
  private 
  
  def movie_params
    params.require(:movie).permit(:title, :note)
  end
end

# This may need a destroy method eventually