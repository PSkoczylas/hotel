FactoryGirl.define do
  factory :term do
    begin_date { Date.current + 1.day }
    end_date { Date.current + Faker::Number.between(2, 1000) }
    room_id { create(:room).id }
    client_id { create(:client).id }
    quantity_of_beds { Faker::Number.between(1, 2) }
  end
end
