class User < ApplicationRecord
  has_many :votes, foreign_key: :voted_id
  has_many :casted_votes, foreign_key: :voter_id, class_name: "Vote"

  has_many :voters, through: :votes, source: :voter #people who voted for this guy
  has_many :voted_for_users, through: :casted_votes, source: :voted #people who this guy voted for

  has_many :orders
  has_many :reviews
  has_many :menu_items, dependent: :nullify

  has_secure_password
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def self.search(search)
    where(["shop_name ILIKE ? OR apartment_number ILIKE ? OR street_number ILIKE ? OR street ILIKE ? OR city ILIKE ? OR state ILIKE ? OR country ILIKE ? OR telephone ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  def full_address
    "#{apartment_number} #{street_number} #{street}, #{city}, #{state} #{country}".squeeze(" ").strip.titleize
  end

  def active_order #cart
    orders.where(active: true).first || orders.create(active: true) #Order.create(user: self, active:true)

    # order = orders.where(active: true).first
    # if order.present?
    #   order
    # else
    #   Order.create(user: self, active: true)
    # end
  end

end
