class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for signing up!"
      session[:remember_token] = @user.id
      @user.quota = 1000
      puts @user.quota
      puts @user.role
      if (@user.role == 'Admin')
        redirect_to groups_path
      else
        redirect_to :root
      end
    else
      raise @user.errors.inspect
      render :new
    end 
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :quota, :role))
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :quota, :role, :group_id)
  end
end