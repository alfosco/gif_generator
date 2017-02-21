class CategoriesController < ApplicationController
  before_action :authorize!, only: [:new, :create, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Created #{@category.title} Category"
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

private

  def category_params
    params.require(:category).permit(:title)
  end

end
