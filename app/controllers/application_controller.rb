class ApplicationController < ActionController::Base
  before_action :set_charset
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    unless logged_in?
      flash[:alert] = "この操作を行うにはログインが必要です"
      redirect_to login_path
    end
  end

  private
  
  def set_charset
    headers["Content-Type"] = "text/html; charset=UTF-8"
  end

end