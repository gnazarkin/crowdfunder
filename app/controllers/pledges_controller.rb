class PledgesController < ApplicationController
  def show
  	@pledge = Pledge.find(params[:id])
  end

  def create
  	@reward = Reward.find(params[:reward_id])
  	@pledge = @reward.pledges.build(reward_id: @reward.id)

  	if @pledge.save
  		@reward.project.update_funded_amount
  		redirect_to @reward_project
  	else
  		render :new
  	end 
  end
end
