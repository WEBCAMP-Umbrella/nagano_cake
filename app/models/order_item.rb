class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

   enum making_status:[
    :着手不可,
    :制作待ち,
    :制作中,
    :制作完了,
  ]


end
