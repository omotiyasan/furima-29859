class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shippingcharge
  belongs_to_active_hash :salesarea
  belongs_to_active_hash :daystoship

  has_one :order
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image, :name, :description, :category, :condition, :shippingcharge, :salesarea, :daystoship, :money
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shippingcharge_id, numericality: { other_than: 1 }
    validates :salesarea_id, numericality: { other_than: 1 }
    validates :daystoship_id, numericality: { other_than: 1 }
    validates :money, numericality: { only_integer: true }
  end
  validates_inclusion_of :money, in: (300..9999999) 
end
