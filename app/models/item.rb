class Item < ApplicationRecord
  belongs_to :genre
  has_many :customers, through: :cart_items
  has_many :orders, through: :order_items
  attachment :image
<<<<<<< HEAD

  enum sale_status:  [:売り切れ, :販売中]

=======
  enum sale_status:  [:売り切れ, :販売中]
>>>>>>> f7369cf47da61c481ce01ba9c488dc60351d52c1
end
