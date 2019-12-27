class GenresController < ApplicationController
  def search
    @genres = Genre.search(params[:q])
  end
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.page(params[:page]).per(10)
  end
end
