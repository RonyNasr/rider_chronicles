class UsersController < ApplicationController

  def after_update_path_for(resource)
    user_path(current_user)
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User Created Successfully"
      redirect_to users_path
    else
      flash[:alert] = "error while saving!"
      render :new
    end
  end

  def show
      @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "User Updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "error while updating!"
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to users_path
  end


private
  def user_params
    params.require(:user).permit(:name,:avatar)
  end
end
