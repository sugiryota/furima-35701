class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,    presence: true
  validates :family_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]/}
  # KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :family_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birth_day,     presence: true   
end
