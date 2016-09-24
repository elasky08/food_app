class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :menu_items, through: :taggings
end
