require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ登録'  do
    context 'ユーザ登録できるとき' do
      it 'ユーザ登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録できないとき' do
      # Department
      it '部署が選択されていないとき、新規登録できない' do
        @user.department_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include 'Department must be other than 1'
      end

      # Job number
      it '職番が入力されていないとき、新規登録できない' do
        @user.job_num = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Job num can't be blank"
      end
      it '職番が7桁以下のとき、新規登録できない' do
        @user.job_num = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Job num must be 8 digits"
      end
      it '職番が8桁を超えるとき、新規登録できない' do
        @user.job_num = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include "Job num must be 8 digits"
      end
      it '職番に数字以外が入力されているとき、新規登録できない' do
        @user.job_num = '12345abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Job num must be 8 digits"
      end

      # Email
      it 'emailが入力されていないとき、新規登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在するとき、新規登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに@が含まれないとき、新規登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      # Password
      it 'passwordが入力されていないとき、新規登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下のとき、新規登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが128文字を超えるとき、新規登録できない' do
        @user.password = Faker::Internet.password(min_length: 130, max_length: 150)
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      it 'passwordとpassword_confirmationが異なるとき、新規登録できない' do
        @user.password = 'Password1'
        @user.password_confirmation = 'Password2'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '数字のみのpasswordが入力されているとき、新規登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must include at least one lowercase letter, one uppercase letter, and one digit"
      end
      it '小文字のみのpasswordが入力されているとき、新規登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must include at least one lowercase letter, one uppercase letter, and one digit"
      end
      it '大文字のみのpasswordが入力されているとき、新規登録できない' do
        @user.password = 'ABCDEF'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must include at least one lowercase letter, one uppercase letter, and one digit"
      end

      # Name
      it 'first_nameが入力されていないとき、新規登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'ローマ字のみのfirst_nameが入力されているとき、新規登録できない' do
        @user.first_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name must contain only full-width Japanese characters"
      end
      it 'last_nameが入力されていないとき、新規登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'ローマ字のみのlast_nameが入力されているとき、新規登録できない' do
        @user.last_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name must contain only full-width Japanese characters"
      end

      it 'first_name_kanaが入力されていないとき、新規登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'ローマ字でfirst_name_kanaが入力されているとき、新規登録できない' do
        @user.first_name_kana = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana must be full-width katakana"
      end
      it 'ひらがなでfirst_name_kanaが入力されているとき、新規登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana must be full-width katakana"
      end
      it '漢字でfirst_name_kanaが入力されているとき、新規登録できない' do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana must be full-width katakana"
      end
      
      it 'last_name_kanaが入力されていないとき、新規登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'ローマ字でlast_name_kanaが入力されているとき、新規登録できない' do
        @user.last_name_kana = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana must be full-width katakana"
      end
      it 'ひらがなでlast_name_kanaが入力されているとき、新規登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana must be full-width katakana"
      end
      it '漢字でlast_name_kanaが入力されているとき、新規登録できない' do
        @user.last_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana must be full-width katakana"
      end
    end

  end
 

end
