require 'rails_helper'

  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録が成功' do
        it "nicknameとemail、passwordとpassword_confirmationが必須" do
          expect(@user).to be_valid
        end

        it "誕生日が必須" do
          @user.birthday = "1943-06-15"
          expect(@user).to be_valid
        end

        it "passwordが6文字以上で半角数字登録" do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          expect(@user).to be_valid 
        end

      end

      context '新規登録が失敗' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
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
          @user.password_confimarion = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password_confimation can't be blank")
        end

        it "passwordが半角英語のみ"
          @user.password = 'aaaaaaa'
          @user.password_confirmation = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
        it "ユーザー本名が全角でない"
          @user.first_name = "aaa"
          @user.last_name = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Name is only 全角")
        end
        it "ユーザー本名（ふりがな）がカタカナでない"
          @user.first_name_furi = "aaa"
          @user.last_name_furi = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Name is only カタカナ")
        end
      end
    end
  end