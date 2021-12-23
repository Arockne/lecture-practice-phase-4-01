class UserGroupsController < ApplicationController

  def create
    user_group = current_user.user_groups.create!(user_group_params)
    render json: user_group, status: :created
  end

  def destroy
    user_group = current_user.user_groups.find(params[:id])
    user_group.destroy
  end

  private

  def user_group_params
    params.permit(:group_id)
  end
end
