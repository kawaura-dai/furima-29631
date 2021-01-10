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
    validates :image
  end
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { greater_than_or_equal_to: 300 }, length: { maximum: 7 }
end
