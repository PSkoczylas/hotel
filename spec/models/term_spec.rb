require 'rails_helper'

RSpec.describe Room, type: :model do
  let!(:term) { build(:term) }
    
  it "has a valid factory" do
    term.should be_valid
  end

  it "end date is later than begin date" do
    build(:term, begin_date: Date.current, end_date: Date.current).should_not be_valid
    build(:term, begin_date: Date.current - 1.day, end_date: Date.current).should be_valid
    build(:term, begin_date: Date.current, end_date: Date.current + 5.days).should be_valid
    build(:term, begin_date: Date.current + 10.days, end_date: Date.current).should_not be_valid
    build(:term, begin_date: Date.current, end_date: Date.current - 1.day).should_not be_valid
  end

  it "quantity of beds is more than zero " do
    build(:term, quantity_of_beds: 0).should_not be_valid
    build(:term, quantity_of_beds: -3).should_not be_valid
    build(:term, quantity_of_beds: 2).should be_valid
  end
  
  it "has relation with room" do
    term.room.should be_valid 
  end

  it "has relation with client" do
    term.client.should be_valid
  end
  
  let!(:room1) { create(:room, quantity_of_beds: 3) }
  let!(:term1) { build(:term, begin_date: Date.current, end_date: Date.current + 3.days, room_id: room1.id, quantity_of_beds: 3) }
  let!(:term2) { build(:term, begin_date: Date.current + 3.days, end_date: Date.current + 5.days, room_id: room1.id, quantity_of_beds: 2) }
  let!(:term3) { build(:term, begin_date: Date.current + 3.days, end_date: Date.current + 5.days, room_id: room1.id, quantity_of_beds: 1) }
  let!(:term4) { build(:term, begin_date: Date.current + 4.days, end_date: Date.current + 7.days, room_id: room1.id, quantity_of_beds: 2) }
  

  it "validates free term" do
    term1.save
    term2.should be_valid
    term2.save
    term3.should be_valid
  end

  it "is not valid free term" do
    term2.save
    term4.should_not be_valid
  end
end
