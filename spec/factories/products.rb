FactoryBot.define do
  factory :product do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png') 
    end
    name { "くまモン" }
    description { "みんな大好きなくまモンです" }
    category_id { 7 }
    condition_id  { 2 }
    shippingcharge_id  { 2 }
    salesarea_id  { 44 }
    daystoship_id  { 2 }
    money  { 5000 }
  end
end
