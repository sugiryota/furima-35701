class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: {with: /(?=.*[a-z])(?=.*\d)[a-z\d]{6,}/}   
  validates :nickname,    presence: true
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :family_name, presence: true
    validates :first_name, presence: true
  end
  # KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
    validates :family_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
  validates :birth_day, presence: true
end
