module SessionsHelper

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def admin?
    logged_in? && current_user.admin?
  end

end
