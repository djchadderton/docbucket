module ControllerAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user, :logged_in?
  end

  private

  def current_user
    Current.user ||= session[:user_id] ? User.find(session[:user_id]) : User.new
  end

  def logged_in?
    Current.user.id?
  end
end
