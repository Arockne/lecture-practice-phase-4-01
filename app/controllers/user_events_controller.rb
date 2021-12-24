class UserEventsController < ApplicationController
  
  def index
    render json: current_user.user_events, status: :ok
  end

  def create
    user_event = current_user.user_events.create!(user_event_params)
    render json: user_event, status: :created
  end

  def destroy
    user_event = current_user.user_events.find(params[:id])
    user_event.destroy
  end

  def update
    user_event = UserEvent.find(params[:id])
    user_event.update(update_user_events_params)
    render json: user_event, status: :ok
  end

  private

  def user_event_params
    params.permit(:event_id)
  end

  def update_user_events_params
    params.permit(:attended)
  end
end
