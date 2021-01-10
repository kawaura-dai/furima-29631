require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '出品確認' do
    it '空白がないと出品可' do
      expect(@item).to be_valid
    end

    it 'imageがないと出品不可' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'product_nameがないと出品不可' do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it 'textがないと出品不可' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'category_idがないと出品不可' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'product_status_idがないと出品不可' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank")
    end

    it 'burden_idがないと出品不可' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it 'prefecture_idがないと出品不可' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'ship_day_idがないと出品不可' do
      @item.ship_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day can't be blank")
    end

    it 'priceがないと出品不可' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが200で出品不可' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
  end
end
