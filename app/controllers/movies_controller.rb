class MoviesController < ApplicationController
  def index
    @movies = current_user.movies.all
  end
end