class CategoriesController < ApplicationController

  # Retrieve a list of categories having more than one assigned location.
  def index
    @categories = Category.where('locations_count > 0').order('name asc')
  end

  # Display a list of locations associated with a category.
  def show
    @category = Category.friendly.find(params[:id])
  end

end
