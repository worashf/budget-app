class CreateSpendingCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :spending_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :spendding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
