class BikesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @bike = @user.bikes.new
  end

  def create
    @user = User.find(params[:user_id])
    @bike = @user.bikes.new(bike_params)
    if @bike.save
      flash[:notice] = "Bike Saved!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "error while saving!"
      render :new
    end
  end

  def show
    @user =User.find(params[:user_id])
    @bike = Bike.find(params[:id])
  end

  def edit
    @user =User.find(params[:user_id])
    @bike = Bike.find(params[:id])
  end

  def update
    @user =User.find(params[:user_id])
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
      flash[:notice] = "Bike updated successfully!"
      redirect_to user_bike_path(@user,@bike)
    else
      flash[:alert] = "error while updating!"
      render :edit
    end
  end

  def destroy
    @user =User.find(params[:user_id])
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to user_path(@user)
  end
  private
  def bike_params
    params.require(:bike).permit(:make, :model, :year, :gearbox, :engine, :category, :color, :drivetrain, :imageURL, :videoURL)
  end
end
