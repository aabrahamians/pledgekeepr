class ChoreInstancesController < ApplicationController
	


	def create
		@chore_instance = current_user.chore_instances.new(chore_id: params[:chore_id])
		if @chore_instance.save
			current_user.update(quota: current_user.quota - @chore_instance.chore.points)
			redirect_to user_path(@current_user)
		else
			render 'new'
		end
	end
end
