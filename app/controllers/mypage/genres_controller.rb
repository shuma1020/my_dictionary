class Mypage::GenresController < ApplicationController
  before_action :authenticate_user!
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.page(params[:page]).per(10)
  end
end
