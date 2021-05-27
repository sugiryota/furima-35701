require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品登録ができる時' do
      it '全ての条件が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができない時' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では登録できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 9_999_999_999_999_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it 'categoryが必須であること' do
        @item.category_id = 1
        @item.valid?

        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'delivery_chargeが必須であること' do
        @item.delivery_charge_id = 1
        @item.valid?

        expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
      end
      it 'delivery_dayが必須であること' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it 'item_conditionが必須であること' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it 'prefectureが必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
    end
  end
end
