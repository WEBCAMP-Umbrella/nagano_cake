class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_items
  has_many :likes, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :customers, through: :likes
  has_many :orders, through: :order_items
  has_many :comments
  attachment :image

  def liked_by?(item,customer)
    likes.find_by(item_id: item.id, customer_id: customer.id).present?
  end

  enum sale_status:  [
    :売り切れ,
    :販売中
  ]

end