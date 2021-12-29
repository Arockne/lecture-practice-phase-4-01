class ApplicationController < ActionController::API
  include ActionController::Cookies
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccesable_entity


  private

  def current_user
   @current_user ||= User.find(session[:user_id])
  end

  def render_unproccesable_entity(invalid)
    render json: invalid.record.errors.full_messages, status: :unprocessable_entity
  end
end
