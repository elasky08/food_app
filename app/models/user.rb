class User < ApplicationRecord
  has_many :votes, foreign_key: :voter_id
  has_many :voters, through: :votes, source: :voter
  has_many :voteds, through: :votes, source: :voted
  has_many :orders, through: :order_items
  has_many :reviews
  has_many :menu_items, dependent: :nullify
  # def voteds
  #   User.joins(:votes).where(votes: Vote.where(voted_id: id))
  # end
end
