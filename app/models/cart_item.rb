class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item

  def self.cart_items_total_price(cart_items)
    array = []
    cart_items.each do |cart_item|
      array << cart_item.item.not_tax_price * cart_item.quantity
    end
    return (array.sum * 1.1).floor
  end
  
end
