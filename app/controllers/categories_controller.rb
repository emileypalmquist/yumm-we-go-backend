class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  def create
    category = Category.create(category_params)
    if category.valid?
      render json: category, status: :created
    else
      render json: { error: 'failed to create category' }, status: :not_acceptable
    end
  end

  private
 
  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
