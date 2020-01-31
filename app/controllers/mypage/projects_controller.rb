class Mypage::ProjectsController < ApplicationController
  before_action :correct_authority, only: [:show]
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @project_posts = @project.project_posts
  end

  def index
    @authorities = Authority.where(email: current_user.email)
    @projects = current_user.projects
  end

  def create
    email = params[:email]
    @project = Project.create_with_authority(project_params, current_user, email)
    respond_to do |format|
      if @project.valid?
        format.html { redirect_to mypage_projects_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @authority = @project.authorities.new(email: params[:email])
    respond_to do |format|
      if @authority.save
        format.html { redirect_to mypage_projects_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @project_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @users = User.search(params[:search])
    render "register"
  end





  private
  def project_params
    params.require(:project).permit(:name,:user_id)
  end

  def correct_project
    project = Project.find(params[:id])
    unless project.users.where(email: current_user.email)
      return false
    end
  end

  def correct_authority
    project = Project.find(params[:id])

    if project.users.where(email: current_user.email).exists?
    elsif  project.authorities.where(email: current_user.email).exists?
    else
      redirect_to mypage_projects_path
    end
  end
end
