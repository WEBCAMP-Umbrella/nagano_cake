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

  validates :name, presence: true
  validates :description, presence: true
  validates :non_taxed_price, presence: true
  validates :image_id, presence: true

  def liked_by?(item,customer)
    likes.find_by(item_id: item.id, customer_id: customer.id).present?
  end

  def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE ?', "%#{search}%"])
  end

  enum sale_status:  [
    :売り切れ,
    :販売中
  ]

end