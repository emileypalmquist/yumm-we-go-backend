class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant
  end

  def create
    restaurant = Restaurant.create(restaurant_params)
    if restaurant.valid?
      render json: restaurant, status: :created
    else
      render json: { error: 'failed to add restaurant' }, status: :not_acceptable
    end
  end

  def update
    restaurant = Restuarant.find(params[:id])
    if restaurant.update(restaurant_params)
      render json: Restuarant, status: :updated
    else
      render json: { error: 'failed to update restaurant' }, status: :not_acceptable
    end
  end

  private
 
  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :location, :hours, :user_id, :rating)
  end
end
