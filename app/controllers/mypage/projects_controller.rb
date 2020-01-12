class Mypage::ProjectsController < ApplicationController
  before_action :set_genres
  def index
    @projects = current_user.projects.page(params[:page]).per(10).order(created_at: :desc)
  end

  def new
    @project = current_user.posts.new
    @genre = Genre.new
  end
private
  def set_genres
    @genres = current_user.genres
  end
end
