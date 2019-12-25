class GenresController < ApplicationController
  def search
    @genres = Genre.search(params[:q])
  end
end
