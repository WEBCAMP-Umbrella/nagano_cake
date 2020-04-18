class Item < ApplicationRecord
  belongs_to :genre
  has_many :customers, through: :cart_items
  has_many :orders, through: :order_items
  attachment :image

  enum sale_status:  [:売り切れ, :販売中]

end
