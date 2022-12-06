module SessionsHelper
  def logged_in?
    current_user = User.find(session[:user_id])
    !current_user.nil?
  end
end
