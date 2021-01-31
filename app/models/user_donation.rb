class UserDonation

  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipality, :building_name, :postal_code, :street_add, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :street_add
    validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/ }
    validates :token
  end

  def save
  buy = Buy.create(user_id: user_id, item_id: item_id)
  ShipAdd.create(prefecture_id: prefecture_id, municipality: municipality, postal_code: postal_code, street_add: street_add, phone_number: phone_number, buy_id: buy.id)
  end
end