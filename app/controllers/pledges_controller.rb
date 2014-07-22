class PledgesController < ApplicationController
  def show
  	@pledge = Pledge.find(params[:id])
  end

  def create
  	@reward = Reward.find(params[:reward_id])
  	@pledge = @reward.pledges.build(reward_id: @reward.id)
    @pledge.user = current_user

  	if @pledge.save
  		@reward.project.funded_amount += @reward.amount
      @reward.project.save
      redirect_to @reward.project
  	else
  		render :new
  	end 
  end
end
