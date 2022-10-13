class SpendingsController < ApplicationController
  def index; end

  def new
    @spending = Spending.new
    @categories = Category.where(user: current_user)
  end

  def create
    @spending = Spending.new(spending_params)
    @spending.author = current_user
    if @spending.save
      redirect_to spendings_path, notice: 'Spending successfully created.'
    else
      render :new, notice: 'Some thing went wrong'
    end
  end

  def destroy
    @spending = Spending.find(params[:id])
    @cat_id = @spending.categories.first.id
    redirect_to category_path(@cat_id) if @spending.destroy
  end

  def update; end

  private

  def spending_params
    params.require(:spending).permit(:name, :amount, category_ids: [])
  end
end
