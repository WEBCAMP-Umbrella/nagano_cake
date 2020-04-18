class Item < ApplicationRecord
  belongs_to :genre
  has_many :customers, through: :cart_items
  has_many :orders, through: :order_items
  attachment :image
<<<<<<< HEAD
  enum sale_status:  [:売り切れ, :販売中]
=======

  enum sale_status:{
    sold_out:     0, #売り切れ
    sale:         1, #販売中
  }
>>>>>>> a73d91816b3516819e2643f4092d8c008d71f8fd
end
