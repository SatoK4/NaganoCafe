class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  
  has_one_attached :image
  
  validates :image       , presence: true
  validates :name        , presence: true
  validates :introduction, presence: true
  validates :price       , presence: true

  def with_tax_price
    tax = 1.10
    (price * tax).round
  end
end
