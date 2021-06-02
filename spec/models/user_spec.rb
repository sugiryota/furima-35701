require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー登録ができる時' do
      it '全ての条件が存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '123hd6'
        @user.password_confirmation = '123hd6'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができない時' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは、@を含む必要があること' do
        @user.email = 'tur.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'family_nameが空では登録できないこと' do
        @user.family_name = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("姓を入力してください")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end

      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ姓を入力してください")
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ名を入力してください")
      end

      it 'birth_dayが空では登録できないこと' do
        @user.birth_day = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '123s5'
        @user.password_confirmation = '123s5'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '1234a6'
        @user.password_confirmation = '1e34567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'family_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は不正な値です")
      end
      it 'first_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'abd'
        @user.valid?
        expect(@user.errors.full_messages).to include("名は不正な値です")
      end
      it 'family_name_kanaは、全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = '安い'
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ姓は不正な値です")
      end
      it 'first_name_kanaは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = '安い'
        @user.valid?
        expect(@user.errors.full_messages).to include("カナ名は不正な値です")
      end
      it 'passwordが英語のみでは登録できないこと' do
        @user.password = 'aabbcc'
        @user.password_confirmation = 'aabbcc'
        expect(@user.errors.full_messages).to include
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'

        expect(@user.errors.full_messages).to include
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = 'DDD555'
        @user.password_confirmation = 'DDD555'
        expect(@user.errors.full_messages).to include
      end
    end
  end
end
