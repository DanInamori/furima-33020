class Item < ApplicationRecord
  belongs_to  :user
  has_one  :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :shipping_area
  belongs_to :shipping_cost

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40} 
    validates :description, length: { maximum: 1000}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "Out of setting range" } 
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number"}
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
end
