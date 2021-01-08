class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_day

  validates :category_id, numericality: { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :ship_day_id, numericality: { other_than: 1 }
end