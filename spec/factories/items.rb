FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name  {Faker::Lorem.sentence}
    info  {Faker::Lorem.sentence}               
    category_id        
    sales_status_id        
    shipping_fee_status_id
    prefecture_id         
    scheduled_delivery_id 
    price              
    user

    association :user 
  end
end



