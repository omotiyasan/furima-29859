FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    prefecture { 15 }
    municipality{ '横浜市南区' }
    block { '1-1' }
    building { '相模ハイツ201' }
    phone { '09012345678' }
  end
end
