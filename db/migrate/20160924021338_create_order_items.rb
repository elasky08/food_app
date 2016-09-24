class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :menu_item, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
