class UserEventsController < ApplicationController
  def create
    user_event = current_user.user_events.create!(user_event_params)
    render json: user_event, status: :created
  end

  def destroy
    user_event = current_user.user_events.find(params[:id])
    user_event.destroy
  end

  private

  def user_event_params
    params.permit(:event_id)
  end
end
