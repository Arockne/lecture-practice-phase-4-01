class EventsController < ApplicationController

  def index
    events = Event.all
    render json: events, status: :ok
  end

  def show
    event = Event.find(params[:id])
    render json: event, include: :attendees, status: :ok
  end

  def create
    event = current_user.events.create!(event_params)
    render json: event, status: :created
  end

  private

  def event_params
    params.permit(:title, :description, :location, :start_time, :end_time, :group_id)
  end
end
