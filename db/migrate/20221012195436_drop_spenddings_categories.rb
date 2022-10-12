class DropSpenddingsCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :spending_categories, force: :cascade
  end
end
