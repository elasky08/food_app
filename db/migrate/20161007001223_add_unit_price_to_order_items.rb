class AddUnitPriceToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :unit_price, :decimal
  end
end
