FactoryBot.define do
  factory :item do
    
    name { Faker::Lorem.word }
    text {Faker::Lorem.sentence}
    price{Faker::Number.between(from: 300, to: 999999)}
    category_id { Faker::Number.within(range: 2..11) }
    item_condition_id { Faker::Number.within(range: 2..11) }
    delivery_charge_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    delivery_day_id { Faker::Number.within(range: 2..4) }
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'test_image.png')
    end
  end
end