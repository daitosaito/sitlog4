class UsersController < ApplicationController
  def show
    @restaurants = User.find(params[:id]).restaurants
    render :partial => 'restaurant'
  end

  def restaurant_show
    @restaurant = Restaurant.find(params[:id])
  end
end
