class ChoresController < ApplicationController
 before_action :authenticate_user

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
	@chore = current_user.groups.new(params.require(:group).permit(:name, :user_id))
	@chore.user_id = current_user.id
	if @chore.save
		redirect_to group_path
	else
		render 'new'
	end
end

def destroy
		@chore= Chore.find(params[:id])
	if (@chore.user_id == current_user.id)
		@chore.destroy
		redirect_to  group_path
	else 

		redirect_to  group_path
	end

end

end
