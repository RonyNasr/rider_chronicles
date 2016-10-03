class ReviewsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @review = @bike.reviews.new
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @review = @bike.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      respond_to do |format|
        format.html {redirect_to user_bike_path(current_user,@bike)}
        format.js
      end
    else
      redirect_to user_bike_path(current_user,@bike)
    end
  end

private

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
