class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items

  accepts_nested_attributes_for :order_items, allow_destroy: true

  def add_to_order(food_menu_item)
    order_items.create(menu_item: food_menu_item)
  end

  def close_order
    update(active: false)
  end

end
