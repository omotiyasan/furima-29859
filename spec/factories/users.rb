FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { "hoge1234"}
    password_confirmation  { "hoge1234"}
    familyname  { "山田" }
    name  { "太郎" }
    familyname_furigana  { "ヤマダ" }
    name_furigana  { "タロウ" }
    birthday  {2000-02-03}
  end
end