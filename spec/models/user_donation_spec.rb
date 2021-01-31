require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  before do
    user = FactoryBot.create(:user)
    @user_donation = FactoryBot.build(:user_donation, user_id: user.id)
  end

  describe '購入テスト' do
    context '購入成功' do
      it 'フォームに空白がない' do
        expect(@user_donation).to be_valid
      end
    end

    context '購入失敗' do
      it 'prefecture_idが1' do
        @user_donation.prefecture_id = 1
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'municipalityが空白' do
        @user_donation.municipality = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'postal_codeが空白' do
        @user_donation.postal_code = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'street_addが空白' do
        @user_donation.street_add = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Street add can't be blank")
      end

      it 'phone_numberが空白' do
        @user_donation.phone_number = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが８桁' do
        @user_donation.phone_number = 01234567
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Phone number is invalid")
      end

      it 'postal_codeにハイフンーがつかない' do
        @user_donation.postal_code = 1234567
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'tokenが空白' do
        @user_donation.token = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
