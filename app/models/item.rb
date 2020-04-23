class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_items
  has_many :customers, through: :cart_items
  has_many :orders, through: :order_items
  attachment :image
  has_many :likes, dependent: :destroy

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

  enum sale_status:  [
    :売り切れ,
    :販売中
  ]

end
