class BikesController < ApplicationController
  def new
    @bike = Bike.new
    render new
  end

  def create
    @user = User.find(params[:user_id])
    @bike = @user.bikes.new(bike_params)
    if @bike.save
      flash [:notice] => "Bike Saved!"
      redirect_to :user_path(@user)
    else
      render :new
    end
  end

  private
  def bike_params
    params.require(:bike).premit(:make, :model, :year, :gearbox, :engine, :category, :color, :drivetrain, :imageURL, :videoURL)
  end
end
