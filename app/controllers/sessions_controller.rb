class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user_id] = 1
  end

  def destroy
  end
end
