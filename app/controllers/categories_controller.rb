class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category created successfuly' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, notice: 'Some thing is wrong' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    @spendings = @category.spendings
  end

  def destroy; end

  def update; end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
