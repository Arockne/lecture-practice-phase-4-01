class SessionsController < ApplicationController

  # post '/login'
  def create
    user = User.find(params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  # delete '/logout'
  def destroy
    session.delete :user_id
    head :no_content
  end
end
