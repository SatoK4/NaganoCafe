class Item < ApplicationRecord
  has_one_attached :image

  def total_price
    tax = 1.10
    (price * tax).round
  end
end
