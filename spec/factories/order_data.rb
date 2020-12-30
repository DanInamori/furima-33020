FactoryBot.define do
  factory :order_data do
    transient do
      gimei { Gimei.address }
    end
    postal_code {Faker::Number.number(digits: 3).to_s + "-" + Faker::Number.number(digits: 4).to_s}
    prefecture_id {2}
    municipality {gimei.city.kanji}
    house_num {gimei.town.kanji}
    building_name {gimei.town.kanji}
    phone_num {Faker::Number.number(digits: 11)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
