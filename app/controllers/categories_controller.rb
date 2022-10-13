class CategoriesController < ApplicationController
  def index
    if user_signed_in?
      @page_title = 'Categories'
      @categories = Category.where(user: current_user)
      @total_spendings = Spending.where(author: current_user).sum(&:amount)
      @category_total = 0
      @categories.each do |cat|
        @category_total = cat.spendings.sum(&:amount)
      end
      @category_total
    else
      @page_title = 'Welcome'
      render 'publics/splash'
    end
  end

  def new
    @category = Category.new
    @page_title = 'New category'
    @back = {
      target: root_path
    }
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

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path, notice: 'Category deleted successfuly'
    else
      redirect_to categories_path, notice: 'Category not deleted '
    end
  end

  def update; end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
