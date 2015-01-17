class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @categories = Category.all
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @review = Review.new(basic_params)
    tag_names = params[:tag_children].keys
    tag_names.each do |tag_name|
      tag = Tag.find_by(:name => "#{tag_name}")
      @review.tags << tag
    end
    @review.save
    redirect_to controller: :restaurants, action: :index
  end

  def edit
    @review = Review.find(params[:id])
    @tags = @review.tags
    @categories = Category.all
  end

  def update
    review = Review.find(params[:id])
    @restaurant = Restaurant.find(review.restaurant_id)
    if review.user_id == current_user.id
    review.update(price: params[:price], review: params[:review])
    review.tags = Tag.where(:name => params[:tag_children].keys)
    review.save
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to controller: :restaurants, action: :index
  end

  private
  def basic_params
    params.require(:review).permit(:price, :review, :restaurant_id, :user_id)
  end



end
