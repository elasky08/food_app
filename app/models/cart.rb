require 'ostruct'
class Cart
  attr_accessor :food_items

  def initialize (cart_hash)
    @food_items = []
    cart_hash.each do |id, quantity|
      menu_item = MenuItem.find(id)
      if menu_item
        food_items << OpenStruct.new(item: menu_item, quantity: quantity)
      end
    end
  end

end
