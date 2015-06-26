class ReviewsController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      flash[:success] = "Review created successfully."
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:danger] = "Review not created successfully."
      render "restaurants/show"
    end
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:success] = "Review edited successfully."
      redirect_to @review
    else
      flash.now[:danger] = "Review not edited successfully."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = "Review deleted successfully."
      redirect_to reviews_path
    else
      flash.now[:danger] = "Review not deleted."
      redirect_to review_path(@review)
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description, :restaurant)
    end
end
