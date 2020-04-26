class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  validates :total_price, presence: true
  validates :addressee, presence: true
  validates :delivery_postcode, presence: true
  validates :delivery_address, presence: true
  validates :payment, presence: true

   enum payment:[
    :銀行振込,
    :クレジットカード
  ]

  enum order_status:[
    :入金待ち,
    :入金確認,
    :制作中,
    :発送準備中,
    :発送済み
  ]


end
