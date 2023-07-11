class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new(user: current_user)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST/TURBO_STREAM /posts
  def create
    return if cancelled

    @post = Post.new(user: current_user, **post_params)
    @folder = @post.folder

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form", partial: "posts/form", locals: {post: @post}) }
      end
    end
  end

  # PATCH/PUT/TURBO_STREAM /posts/1
  def update
    return if cancelled

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form", partial: "posts/form", locals: {post: @post}) }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:user_id, :title, :body, :folder_id)
  end

  def cancelled
    params[:commit] == "Cancel"
  end
end
