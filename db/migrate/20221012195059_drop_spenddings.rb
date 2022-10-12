class DropSpenddings < ActiveRecord::Migration[7.0]
  def change
    drop_table :spenddings, force: :cascade
  end
end
