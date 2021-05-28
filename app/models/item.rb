class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :delivery_day_id
      validates :item_condition_id
    end
  end
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :user
  has_one    :pay
end
