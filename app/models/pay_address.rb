class PayAdress

  include ActiveModel::model
  attr_accessor :postal_code,:prefecture_id,:city,:address,:building_name,:phone_number,:item_id,:user_id
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    pay = Pay.create(item_id: item_id,user_id: user_id)

    Adress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number,pay_id: pay.id)

  end

end