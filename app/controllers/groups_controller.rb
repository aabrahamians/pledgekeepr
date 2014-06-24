class GroupsController < ApplicationController
 before_action :authenticate_user

def index
	@groups = Group.all
end

def show 
	@group = Group.find(params[:id])
end

def new
	@group = Group.new
end

def create
	@group = current_user.groups.new(params.require(:group).permit(:name, :user_id))
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

end
