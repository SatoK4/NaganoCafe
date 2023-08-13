class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sub_total
    tax = 1.1
    ((item.price * amount) * tax).to_i
  end
end
