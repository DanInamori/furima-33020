FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    price { 1000 + Faker::Number.number(digits: 4)}
    description {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    shipping_cost_id {2}
    shipping_area_id {2}
    days_to_ship_id{2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/images_test.png'), filename: 'images_test.png')
    end
  end
end
