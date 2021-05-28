require 'rails_helper'

RSpec.describe PayAddress, type: :model do
  describe '支払い情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @pay_address = FactoryBot.build(:pay_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@pay_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @pay_address.building_name = ' '
        expect(@pay_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'addressが空だと保存できないこと' do
        @pay_address.address = ' '
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @pay_address.postal_code = ' '
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @pay_address.postal_code = '1234567'
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @pay_address.prefecture_id = 0
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @pay_address.city = ' '
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @pay_address.phone_number = ' '
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内の数値のみ保存可能なこと' do
        @pay_address.phone_number = 415_665_516_541
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @pay_address.user_id = nil
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @pay_address.item_id = nil
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @pay_address.token = nil
        @pay_address.valid?
        expect(@pay_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
