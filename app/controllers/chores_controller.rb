class ChoresController < ApplicationController
 before_action :authenticate_user
 before_action :groupfinder, only: [:index, :create, :new, :show]

def index
	@chores = Chore.all 
end

def show 
	@chore = Chore.find(params[:id])
end

def new
	@chore = Chore.new
end

def create
	@chore = current_user.chores.new(params.require(:chore).permit(:name, :description, :points, :group_id))
	# @chore.user_id = current_user.id
	if @chore.save
		redirect_to group_path(@group)
	else
		render 'new'
	end
end

def destroy
		@chore= Chore.find(params[:id])
	
		@chore.destroy
		redirect_to  group_path


end


private
def groupfinder
	@group = Group.find(params[:group_id])
end

end
