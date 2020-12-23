FactoryBot.define do
  factory :user do
    transient do
      gimei { Gimei.name }
   end
    nickname  {Faker::Name.initials(number: 2)}
    email  {Faker::Internet.free_email}
    password  {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    first_name_kanji  {gimei.first.kanji}
    last_name_kanji  {gimei.last.kanji}
    first_name_katakana  {gimei.first.katakana}
    last_name_katakana  {gimei.last.katakana}
    birthday  {Faker::Date.backward}
  end
end