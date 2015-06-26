class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order("name ASC")
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
     flash[:success] = "Restaurant created successfully."
     redirect_to restaurants_path
    else
     flash.now[:danger] = "Restaurant not created successfully."
     render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
     flash[:success] = "Restaurant edited successfully."
     redirect_to @restaurant
    else
     flash.now[:danger] = "Restaurant not edited successfully."
     render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.destroy
     flash[:success] = "Restaurant deleted successfully."
     redirect_to restaurants_path
    else
     flash.now[:danger] = "Restaurant not deleted."
     redirect_to question_path(@restaurant)
    end
  end

  private
    def restaurant_params
     params.require(:restaurant).permit(
      :name,
      :street1,
      :street2,
      :city,
      :state,
      :zipcode,
      :description
    )
    end
end
