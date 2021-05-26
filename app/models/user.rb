class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: {with: /(?=.*[a-z])(?=.*\d)[a-z\d]{6,}/}   
  with_options presence: true do
    validates :nickname    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :family_name
      validates :first_name
    end
  
    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :birth_day
  end
  has_many :items
  
end
