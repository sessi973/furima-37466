FactoryBot.define do
  factory :order_shared do
    token {"tok_abcdefghijk0000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number { '09012345678' }
    building { '東京ハイツ' }
    
    
  end
end
