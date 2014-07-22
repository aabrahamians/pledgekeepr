class GroupsController < ApplicationController
 before_action :chorebringer, only: [:show]
 before_action :authenticate_user

def index
	@groups = Group.where(user_id: current_user.id)
end

def show 
	@group = Group.find(params[:id])
	@group_quota_sum = @group.pledges.sum(:quota).to_f
	@total_in_group = (@group.pledges.count * 1000).to_f
	@total_group_progress = @group_quota_sum/@total_in_group
end

def new
	@group = Group.new
end

def create    
	@group = current_user.groups_admined.new(params.require(:group).permit(:name, :user_id))
	@group.user_id = current_user.id
	if @group.save
		redirect_to groups_path
	else
		render 'new'
	end
end

def destroy
		@group= Group.find(params[:id])
	if (@group.user_id == current_user.id)
		@group.destroy
		redirect_to  groups_path
	else 

		redirect_to  groups_path
	end

end

private
def chorebringer
	@chore = Chore.new
end

end
