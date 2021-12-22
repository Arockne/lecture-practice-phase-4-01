class GroupsController < ApplicationController
rescue_from ActiveRecord::InvalidRecord, with: :render_unproccesable_entity
  def index
    groups = Group.all
    render json: groups, status: :ok
  end

  def show
    group = Group.find(params[:id])
    render json: group, include: :events
  end

  def create
    group = Group.create!(group_params)
    render json: group, status: :created
  end

  private

  def group_params
    params.permit(:name, :location)
  end
end
