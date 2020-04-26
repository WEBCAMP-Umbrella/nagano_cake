class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses
  has_many :cart_items
  has_many :likes, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :items, through: :likes
  has_many :orders
  has_many :comments

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :phone_number, presence: true, length: { maximum: 13 }
  validates :address, presence: true
  validates :postal_code, presence: true, length: { is: 7 }

  def active_for_authentication?
    super && self.is_cancel? == false
  end
end
