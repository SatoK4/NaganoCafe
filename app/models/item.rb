class Item < ApplicationRecord
  has_many :cart_
  has_many :order_details
  
  has_one_attached :image
  
  validates :name        , presence: true
  validates :introduction, presence: true
  validates :price       , presence: true
  validates :image       , presence: true

  def total_price
    tax = 1.10
    (price * tax).round
  end
end
