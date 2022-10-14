class CreateSpenddings < ActiveRecord::Migration[7.0]
  def change
    create_table :spenddings do |t|
      t.string :name
      t.decimal :amount, default: 0
      t.references :author, null: false, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
