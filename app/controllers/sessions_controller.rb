class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user
      else
        render json: { errors: ["Invalid username or password"] }, status: 401
      end
  end

  def destroy
    session.clear
    render json: { message: ["Logged out"]}
  end
end
