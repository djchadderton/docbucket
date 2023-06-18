class SessionsController < ApplicationController
  def new
    create
  end

  def create
    session[:user_id] = 1
  end

  def destroy
  end
end
