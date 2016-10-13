class MenuItem < ApplicationRecord
  mount_uploader :image, AvatarUploader
  belongs_to :user

  has_many :order_items
  has_many :orders, through: :order_items

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  # accepts_nested_attributes_for :menu_items, reject_if: :all_blank, allow_destroy: true

end
