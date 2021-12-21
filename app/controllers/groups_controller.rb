class GroupsController < ApplicationController

  def index
    groups = Group.all
    render json: groups, status: :ok
  end

  def show
    group = Group.find(params[:id])
    render json: group, include: :events
  end
end
