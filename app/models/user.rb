class User < ApplicationRecord
  has_many :votes
  has_many :voters, through: :votes, source: :vote
  has_many :orders, through: :order_items
  has_many :reviews
  has_many :menu_items, dependent: :nullify
end
