FactoryBot.define do
  factory :pay_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_a508d15bf64c903eedabdded25ef' }
  end
end
