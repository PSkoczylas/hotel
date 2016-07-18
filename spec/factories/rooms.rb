FactoryGirl.define do
  factory :room do
    room_number { Faker::Number.between(1, 90000) }
    floor { Faker::Number.between(1, 300) }
    quantity_of_beds { Faker::Number.between(1, 4) }
    standard { Faker::Number.between(0, 2) }
    price { Faker::Number.between(0, 2000) }
  end
end
