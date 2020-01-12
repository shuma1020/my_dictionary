class Mypage::ProjectsController < ApplicationController
  before_action :set_genres
  def index
    @projects = current_user.projects.page(params[:page]).per(10).order(created_at: :desc)
  end

  def new
    @project = current_user.projects.new
    @genre = Genre.new
  end

  def create
    @user =
    if current_user
    @project = current_user.projects.new(project_params)
    elsif Email.where(projectmember_id: projectmember.id)
    genre = @project.genres.new(genre_params)
    @genre.user_id = current_user.id
    end
  end
private
  def set_genres
    @genres = current_user.genres
  end

  def project_params
    params.require(:project).permit(:title, :body, :status, :posted_at, :reason, :url, :summary, genre_ids: [])
  end
end
