class MenuItem < ApplicationRecord
  belongs_to :user
  has_many :orders, through: :order_items
  has_many :order_items
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
