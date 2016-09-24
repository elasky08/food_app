class Tagging < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
  belongs_to :tag
end
