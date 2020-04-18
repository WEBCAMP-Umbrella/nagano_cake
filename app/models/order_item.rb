class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

   enum making_status:{
    cant:        0, #着手不可
    waiting:     1, #制作待ち
    creating:    2, #制作中
    complete:    3, #制作完了
  }

end
