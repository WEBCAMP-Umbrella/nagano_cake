class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :addressee, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true

  def name_address
    self.addressee + "　〒" + self.postal_code.insert(3, "-") + "　" + self.address
  end
end
