class ApplicationController < ActionController::API
  include ActionController::Cookies
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccesable_entity


  private

  def current_user
    User.first
  end

  def render_unproccesable_entity(invalid)
    render json: invalid.record.errors.full_messages, status: :unprocessable_entity
  end
end
