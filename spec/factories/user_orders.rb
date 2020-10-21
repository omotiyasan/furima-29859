FactoryBot.define do
  factory :user_order do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { 15 }
    municipality { '横浜市南区' }
    block { '1-1' }
    building_name { '相模ハイツ201' }
    phone { '09012345678' }
  end
end
