class ShippingAddress < ApplicationRecord
  belongs_to :customer

  def name_address
    self.addressee + "　〒" + self.postal_code.insert(3, "-") + "　" + self.address
  end
end
