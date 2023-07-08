class HomepageController < ApplicationController
  def show
    @folders = Folder.all
  end
end
