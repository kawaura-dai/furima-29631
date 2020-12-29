require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do

      context '新規登録が成功' do
        it "空白がないのが必須" do
          expect(@user).to be_valid
        end
      end

      context '新規登録が失敗' do
        it "nicknameが空だと登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "emailに@がつかないと登録できない" do
          @user.email = "sample12345.sample12345.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "passwordが空では登録できない" do
         @user.password = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordが5文字以下であれば登録できない" do
          @user.password = "00000"
          @user.password_confirmation = "00000"
          @user.valid?
         expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password = "00000123"
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordが半角英語のみ" do
          @user.password = 'aaaaaaa'
          @user.password_confirmation = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "ユーザー名前が全角でない" do
          @user.first_name = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it "ユーザー苗字が全角でない" do
          @user.last_name = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it "苗字がないと登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "苗字のふりがながないと登録できない" do
          @user.last_name_furi = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name furi can't be blank")
        end

        it "名前がないと登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "名前のふりがながないと登録できない" do
          @user.first_name_furi = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name furi can't be blank", "First name furi is invalid")
        end

        it "ユーザー名前（ふりがな）がカタカナでない" do
          @user.first_name_furi = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name furi is invalid")
        end
        
        it "ユーザー苗字（ふりがな）がカタカナでない" do
          @user.last_name_furi = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name furi is invalid")
        end

        it "誕生日が空だと登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

      end
    end
  end