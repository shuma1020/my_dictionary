class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(status: "release").page(params[:page]).per(10).order(created_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if Genre.exists?(id: params[:id]) or Genre.exists?(id: params[:genre_id])
    @genre = Genre.find(params[:genre_id])
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    @genre = Genre.new
  end

  # GET /posts/1/edit
  def edit
    @genre = Genre.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
    @genre = @post.genres.new(genre_params)
    @genre.save
    respond_to do |format|
      if @post.save
        format.html { redirect_to mypage_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    genre = @post.genres.create!(genre_params)
    aa = post_params
    aa[:genre_ids] << genre.id
    respond_to do |format|
      if @post.update(aa)
        format.html { redirect_to mypage_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to mypage_posts_path(@post), notice: 'Post was successfully destroyed.' }
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
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :status, :posted_at, :reason, :rank, :url, :summary, genre_ids: [])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end

    def manage_params
      params.require(:manage).permit(:post_id, :genre_id)
    end


end
