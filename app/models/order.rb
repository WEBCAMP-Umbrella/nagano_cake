class Order < ApplicationRecord
  belongs_to :customer

   enum payment:{
    bank:            0, #銀行振込
    credit_card:     1, #クレジットカード
  }

  enum order_status:{
    waiting:     0, #入金待ち
    confirm:     1, #入金確認
    creating:    2, #制作中
    prepare:     3, #発送準備中
    sent:        4, #発送済み
  }

end
