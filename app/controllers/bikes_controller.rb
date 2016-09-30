class BikesController < ApplicationController
  def new
    @user = current_user
    @bike = @user.bikes.new
  end

  def create
    @user = current_user
    @bike = @user.bikes.new(bike_params)
    if @bike.save
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
    else
      flash[:notice] = "error while creating!"
      redirect_to user_path(current_user)
    end
  end

  def show
    @user =current_user
    @bike = Bike.find(params[:id])
  end

  def edit
    @user =current_user
    @bike = Bike.find(params[:id])
  end

  def update
    @user =current_user
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
    @user =current_user
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to user_path(@user)
  end
  private
  def bike_params
    params.require(:bike).permit(:make, :model, :year, :gearbox, :engine, :category, :color, :drivetrain, :imageURL, :videoURL)
  end
end
