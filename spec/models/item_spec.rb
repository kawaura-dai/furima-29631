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

    it 'category_idが１だと出品不可' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'product_status_idが１だと出品不可' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status must be other than 1")
    end

    it 'burden_idが１だと出品不可' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end

    it 'prefecture_idが１だと出品不可' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'ship_day_idが１だと出品不可' do
      @item.ship_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day must be other than 1")
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

    it 'priceが10000000以上で出品不可' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is too long (maximum is 7 characters)")
    end

    it 'priceが全角で出品不可' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is too long (maximum is 7 characters)")
    end

    it 'priceが英字で出品不可' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is too long (maximum is 7 characters)")
    end

    it 'priceが数字＋文字で出品不可' do
      @item.price = '1000a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is too long (maximum is 7 characters)")
    end
  end
end
