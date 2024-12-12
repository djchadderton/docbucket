class FoldersController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_folder, only: %i[show edit update destroy]

  # GET /folders
  def index
    @folders = Folder.all
  end

  # GET /folders/1
  def show
    @posts = @folder.posts
    @post = @posts.first
    respond_to do |format|
      format.html
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.update("post-list", template: "folders/show"),
          @post ? turbo_stream.replace("post-detail", template: "posts/show") : turbo_stream.update("post-detail", "")
        ]
      }
    end
  end

  # GET /folders/new
  def new
    @folder = Folder.new
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  def create
    @folder = Folder.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to folder_url(@folder), notice: "Folder was successfully created." }
        format.turbo_stream { render turbo_stream: turbo_stream.update("post-list", template: "folders/show") }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("modal", template: "folders/new") }
      end
    end
  end

  # PATCH/PUT /folders/1
  def update
    @posts = @folder.posts

    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to folder_url(@folder), notice: "Folder was successfully updated." }
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.update("post-list", template: "folders/show"),
            turbo_stream.replace(dom_id(@folder, :header), partial: "posts/post_header", locals: {folder: @folder})
          ]
        }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.update("modal", template: "folders/edit") }
      end
    end
  end

  # DELETE /folders/1
  def destroy
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url, notice: "Folder was successfully destroyed." }
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.update("post-detail", ""),
          turbo_stream.update("post-list", "")
        ]
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_folder
    @folder = Folder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def folder_params
    params.require(:folder).permit(:name)
  end
end
