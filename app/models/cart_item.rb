class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sub_total
    tax = 1.1
    ((cart_item.item.price * cart_item.amount) * tax).to_i
  end
end
