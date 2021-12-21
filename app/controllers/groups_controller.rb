class GroupsController < ApplicationController

  def index
    groups = Group.all
    render json: groups, status: :ok
  end

  def show
    group = Group.find(group_params[:id])
    render json: group, include: :events
  end

  private

    def group_params
      params.permit
    end
end
