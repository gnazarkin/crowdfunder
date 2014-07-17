class RewardsController < ApplicationController
  def show
  	@reward = Reward.find(params[:id])
  end

  def create
  	@project = Project.find(params[:project_id])
  	@reward = @project.rewards.build(reward_params)
  end

  def destroy
  end

  def update
  end

  private
  def reward_params
  	params.require(:reward).permit(:amount, :description, :project_id, :name)
  end
end
