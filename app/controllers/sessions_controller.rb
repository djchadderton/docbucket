class SessionsController < ApplicationController
  def new
    create
  end

  def create
    session[:user_id] = User.first.id
  end

  def destroy
  end
end
