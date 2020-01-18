class Mypage::ProjectsController < ApplicationController
  def new
    @project= current_user.projects.new
  end

  def show
    
  end

  def create
    @project = current_user.projects.new(project_params)
    @projects = Project.all
    respond_to do |format|
      if @project.save
        format.html { redirect_to mypage_projects_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
