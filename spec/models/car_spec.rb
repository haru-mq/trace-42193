require 'rails_helper'

RSpec.describe Car, type: :model do
  before do
    @car = FactoryBot.build(:car, user: FactoryBot.create(:user))
  end

  describe '車両登録' do
    context '車両登録できるとき' do
      it '発売日ありの車両を登録できる' do
        expect(@car).to be_valid
      end
      it '発売日なしの車両を登録できる' do
        @car.launch_date = nil
        expect(@car).to be_valid
      end
    end

    context '車両登録できないとき' do
      it '車両名が入力されていないとき、新規登録できない' do
        @car.car_name = ''
        @car.valid?
        expect(@car.errors.full_messages).to include "Car name can't be blank"
      end
      it 'ユーザが選択されていないとき、新規登録できない' do
        @car.user_id = nil
        @car.valid?
        expect(@car.errors.full_messages).to include "User must exist"
      end
    end
  end
end