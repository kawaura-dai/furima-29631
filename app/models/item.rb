class Item < ApplicationRecord

  belongs_to :user
  has_one    :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :ship_day

  with_options presence: true do
    validates :product_name
    validates :text
    validates :category_id
    validates :product_status_id
    validates :burden_id
    validates :prefecture_id
    validates :ship_day_id
    validates :price
    validates :image
    end 
  validates :user, presence: true
end
