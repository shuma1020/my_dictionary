class Mypage::ProjectsController < ApplicationController
  def new
    @project_post = Project.find(params[:project_id])
  end

  def show
    @project = Project.find(params[:id])
    @posts =@project.project_posts
  end

  def index
    @authorities = Authority.where(email: current_user.email)
    @projects = current_user.projects
  end

  def create
    @project = current_user.projects.new(project_params)
    @projects = Project.all
    @authorities = @project.authorities.new(email: params[:email])
    respond_to do |format|
      if @project.save
        @authorities.save
        format.html { redirect_to mypage_projects_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @users = User.search(params[:search])
    render "register"
  end





  private
  def project_params
    params.require(:project).permit(:name)
  end
end
