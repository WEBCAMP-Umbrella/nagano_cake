class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses
  accepts_nested_attributes_for :shipping_addresses
  has_many :items, through: :cart_items
  has_many :orders
end
