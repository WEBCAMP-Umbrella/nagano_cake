class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :item,optional: true

  validates :content, presence: true
end
