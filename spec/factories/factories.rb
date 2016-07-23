FactoryGirl.define do
  factory :room do
    room_number { Faker::Number.between(1, 90000) }
    floor { Faker::Number.between(1, 300) }
    quantity_of_beds { Faker::Number.between(2, 4) }
    standard { Faker::Number.between(0, 2) }
    price { Faker::Number.between(0, 2000) }
  end

  factory :client do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
  end
  
  factory :term do
    begin_date { Date.current + 1.day }
    end_date { Date.current + Faker::Number.between(2, 1000) }
    room_id { create(:room).id }
    client_id { create(:client).id }
    quantity_of_beds { Faker::Number.between(1, 2) }
  end
end
