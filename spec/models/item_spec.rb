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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'textが空では登録できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("テキストを入力してください")
      end
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください")
      end
      it 'priceが¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300以上の値にしてください")
      end
      it 'priceが¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 9_999_999_999_999_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は9999999以下の値にしてください")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it 'priceが半角英数混合ではできないこと' do
        @item.price = '44a'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it '画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'categoryが必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'delivery_chargeが必須であること' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料は1以外の値にしてください")
      end
      it 'delivery_dayが必須であること' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送日程は1以外の値にしてください")
      end
      it 'item_conditionが必須であること' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it 'prefectureが必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
    end
  end
end
