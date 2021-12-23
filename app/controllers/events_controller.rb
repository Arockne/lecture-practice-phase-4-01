class EventsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    events = Event.all
    render json: events, status: :ok
  end

  def show
    event = Event.find(params[:id])
    render json: event, include: :attendees, status: :ok
  end

  def create
    event = current_user.created_events.create!(event_params)
    render json: event, status: :created
  end

  def destroy
    event = current_user.created_events.find(params[:id])
    event.destroy
  end

  def update
    event = current_user.created_events.find(params[:id])
    event.update!(event_params)
    render json: event, status: :ok
  end

  private

  def event_params
    params.permit(:title, :description, :location, :start_time, :end_time, :group_id)
  end

  def render_not_found
    render json: { error: "Event not found" }, status: :not_found
  end
end
