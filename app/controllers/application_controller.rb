class ApplicationController < ActionController::API
  include ActionController::Cookies

  def login
    user = User.find_by(username: params[:username])
    if (user && user.authenticate(params[:password]))
      render json: {user: user}
    else
      render json: {errors: "Invalid username or password"}
    end
  end
end
