class AddShopNameColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shop_name, :string
  end
end
