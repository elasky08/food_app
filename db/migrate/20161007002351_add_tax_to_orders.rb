class AddTaxToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :tax, :decimal
  end
end
