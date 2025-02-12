class AddBalanceToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :balance, :decimal, precision: 12, scale: 2, default: 0.0, null: false
  end
end
