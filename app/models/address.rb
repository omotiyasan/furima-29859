class Address < ApplicationRecord
  belongs_to :order
  # belongs_to_active_hash :prefecture

  # with_options presence: true do
  #   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  #   validates :municipality
  #   validates :block
  #   validates :building
  #   validates :phone, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{11}+\z/i }
  #   # validates :money, numericality: { only_integer: true }
  # end
  # validates_inclusion_of :money, in: (300..9999999)
end
