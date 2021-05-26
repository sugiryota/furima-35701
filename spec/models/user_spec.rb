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
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは、@を含む必要があること' do
        @user.email = 'tur.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
  
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'family_nameが空では登録できないこと' do
        @user.family_name = ''
        @user.valid?
  
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
  
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
  
      it 'birth_dayが空では登録できないこと' do
        @user.birth_day = ''
        @user.valid?
  
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      
  
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '123s5'
        @user.password_confirmation = '123s5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '1234a6'
        @user.password_confirmation = '1e34567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'family_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'abd'
        @user.valid?
  
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_name_kanaは、全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = '安い'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'first_name_kanaは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = '安い'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'passwordが英語のみでは登録できないこと' do
        @user.password = 'aabbcc'
        @user.password_confirmation = 'aabbcc'
        expect(@user.errors.full_messages).to include( )
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        
        expect(@user.errors.full_messages).to include( )
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = 'DDD555'
        @user.password_confirmation = 'DDD555'
        expect(@user.errors.full_messages).to include( )
      end
    end
    
  end
end
