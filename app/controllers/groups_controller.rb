class GroupsController < ApplicationController
 # before_action :authenticate_user

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
	@group = Group.new(params.require(:group).permit(:name))
	if @group.save
		redirect_to groups_path
	else
		render 'new'
	end
end

end
