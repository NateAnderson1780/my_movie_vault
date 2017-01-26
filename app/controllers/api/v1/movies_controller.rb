class Api::V1::MoviesController < ApplicationController
  def create 
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: 201
    else
      render json: @movie.errors.full_messages.join(', '), status: 500
    end
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      head :no_content
    else
      render json: @movie.errors.full_messages.join(', '), status: 500
    end
  end
  
  private
  
  def movie_params
    params.permit(:title, :note, :watched).merge(user_id: current_user.id)
  end
end