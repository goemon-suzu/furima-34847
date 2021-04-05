FactoryBot.define do
  factory :item do
    item_name             { Faker::Name.name }
    description           { Faker::Lorem.sentence }
    category_id           { rand(1..10) }
    condition_id          { rand(1..6) }
    delivery_setting_id   { rand(1..2) }
    shipment_area_id      { rand(1..47) }
    shipping_day_id       { rand(1..3) }
    price                 { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
