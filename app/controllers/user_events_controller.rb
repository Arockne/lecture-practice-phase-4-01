class UserEventsController < ApplicationController
  def create
    user_event = current_user.user_events.create!(user_event_params)
    render json: user_event, status: :created
  end

  private

  def user_event_params
    params.permit(:event_id)
  end
end
