class RestaurantsController < ApplicationController
before_filter :authenticate_user!, only: :new


  def index
    @restaurants = Restaurant.all
    @areas = Restaurant.group(:area).order('count_area desc').count('area').keys.compact
    @categories = Category.all
    @tag_group1 = Tag.where(id: 1..3)
    @tag_group2 =Tag.where(id: 4..5)
    @tag_group3 =Tag.where(id: 6..7)
    @tag_group4 =Tag.where(id: 8..9)
    @tag_group5 =Tag.where(id: 10..11)
    @fake = Restaurant.new
  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all
  end

  def create
    if Restaurant.where(:name => info_params.values[0])
      redirect_to action: "new", notice: '既に同じレストランが存在しています！' and return
    end
    @restaurant = Restaurant.where(:name => info_params.values[0]).first_or_initialize(info_params)
    @restaurant.user_id = current_user.id
    if params[:tag_children]
      params[:tag_children].keys.each do |tag_child|
        @restaurant.tags << Tag.find_by(:name => "#{tag_child}")
      end
    end

    if @restaurant.save
      redirect_to action: "index" and return
    else
      redirect_to action: "new", notice: 'レストラン名とエリアを入力して下さい！！' and return
    end

  end

  def restaurant_search
    @restaurants = Restaurant.where("name LIKE(?)", "%#{key_info[:restaurant]}%")
  end

  def tag_search
    if params[:tag_children]
      names = params[:tag_children].keys
      @restaurants = Tag.find_by(name: names[0]).restaurants
      names.each do |tag_child|
        tag = Tag.find_by(name: tag_child)
        @restaurants = @restaurants.includes(:tags).where(restaurants_tags: {restaurant_id: tag.restaurant_ids}).references(:tags)
      end

      # @restaurants = Tag.where(name: names).map { |i| i.restaurants}.flatten
      # @restaurants = names.map { |tag_child| Tag.find_by(name: "#{tag_child}").restaurants }.flatten これはうえの1文と全く同じものをとってきている！
    end
  end

  def area_search
    @restaurants = Restaurant.where(area: params[:params_area])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @user = @restaurant.user
    @reviews = @restaurant.reviews
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @tags = @restaurant.tags
    @categories = Category.all
  end

  def update
    restaurant = Restaurant.find(params[:id])
    if restaurant.user_id == current_user.id
    restaurant.update(name: params[:name], price: params[:price], review: params[:review])
    restaurant.tags = Tag.where(:name => params[:tag_children].keys)
    restaurant.save
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    redirect_to action: :index
  end

  private
   def info_params
    params.require(:restaurant).permit(:name, :price, :tag_list, :area, :review)
   end

   def key_info
    params.permit(:restaurant)
   end

end