class Item < ApplicationRecord
  
  with_options presence:true do
    validates :name
    validates :text
    validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},format:{ with:/\A[0-9]+\z/ }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :delivery_day_id
    end
    
   
  end
  has_one_attached :image

  # validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :user

  
end
