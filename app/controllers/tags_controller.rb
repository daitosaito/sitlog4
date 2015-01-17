class TagsController < ApplicationController

  def show
    tag = Tag.find(params[:id])
    @restaurants = Restaurant.tagged_with("#{tag.name}")
  end

end
