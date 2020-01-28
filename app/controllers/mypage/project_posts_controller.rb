class Mypage::ProjectPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_post, only: [:show, :edit, :update, :destroy]
  before_action :set_genres
  before_action :set_project
  before_action :correct_authority, only: [:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @project_posts = @project.project_posts.page(params[:page]).per(10).order(created_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @project = Project.find(params[:project_id])
    @project_post = @project.project_posts.find(params[:id])
  end

  # GET /posts/new
  def new
    @project_post = ProjectPost.new
    @post = @project.project_posts.new
    @genre = Genre.new
  end

  # GET /posts/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @project_post = @project.project_posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @project_post = @project.project_posts.new(project_post_params)
    respond_to do |format|
      if @project_post.save
        format.html { redirect_to mypage_project_path(@project), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @project_post }
      else
        format.html { render :new }
        format.json { render json: @project_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @project_post.update(project_post_params)
        format.html { redirect_to mypage_project_project_post_path(@project,@project_post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @project_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @project_post.destroy
    respond_to do |format|
      format.html { redirect_to mypage_project_path(@project), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def important
    @posts = Post.where(rank:"important")
  end

  def most
    @posts = Post.where(rank:"most")
  end

  def search
    @posts = Post.search(params[:q]).page(params[:page]).per(10)
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_post
      project = Project.find(params[:project_id])
      @project_post = project.project_posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_post_params
      params.require(:project_post).permit(:title, :body, :status, :posted_at, :reason, :rank, :url, :summary, genre_ids: [])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end

    def manage_params
      params.require(:manage).permit(:post_id, :genre_id)
    end

    def set_genres
      @genres = current_user.genres
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def correct_authority
      project = Project.find(params[:project_id])
      unless project.authorities.where(email: current_user.email).exists?
        redirect_to mypage_projects_path
      end
    end
end
