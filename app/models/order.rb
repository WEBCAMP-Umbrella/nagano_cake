class Order < ApplicationRecord
  belongs_to :customer


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
