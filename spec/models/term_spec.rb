require 'rails_helper'

RSpec.describe Room, type: :model do
#  let!(:client) { create(:client) }
#  let!(:room) { create(:room) }
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
end
