class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_items
  has_many :customers, through: :cart_items
  has_many :orders, through: :order_items
  attachment :image
  has_many :likes, dependent: :destroy

   def like_customer(customer_id)
   likes.find_by(customer_id: customer_id)
  end

  enum sale_status:  [
    :売り切れ,
    :販売中
  ]

end
