require 'rails_helper'

RSpec.describe Room, type: :model do
  let!(:room) { build(:room) }
  it "has a valid factory" do
    room.should be_valid
  end

  it "room number and floor presents" do
    build(:room, room_number: nil, floor: nil).should_not be_valid
    build(:room, floor: nil).should_not be_valid
    build(:room, room_number: nil).should_not be_valid
  end

  it "does unique rooms" do
    room_dup = room.dup
    room.save
    room_dup.should_not be_valid
  end

  it "does the same room number on other floors" do
    room_dup = room.dup
    room_dup.floor += 1
    room.save
    room_dup.should be_valid
  end

  it "does the same floor on other room numbers" do
    room_dup = room.dup
    room_dup.floor += 1
    room.save
    room_dup.should be_valid
  end

  it "does the same room numbers on other floors" do
    room_dup = room.dup
    room_dup.room_number += 1
    room.save
    room_dup.should be_valid
  end

  it "room number presents" do
    build(:room, room_number: "    ").should_not be_valid
  end

  it "floor presents" do
    build(:room, floor: "   ").should_not be_valid
  end

  it "standard with too big values" do
    expect { build(:room, standard: 3) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid standard/)
    
    expect { build(:room, standard: 1000) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid standard/)
    
    expect { build(:room, standard: :bad) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid standard/)
  end

  it "standard with good values" do
    build(:room, standard: 0).should be_valid
    build(:room, standard: 2).should be_valid
    build(:room, standard: :higher).should be_valid
  end

  it "standard is the same with number and enum" do
    build(:room, standard: 2).should be_valid
    room_dup = room.dup
    room_dup.standard = :highest
    room.save
    room_dup.should_not be_valid
  end

  it "values are more or equal to zero (floor to minus one)" do
    build(:room, room_number: -4, floor: -3).should_not be_valid
    build(:room, room_number: -1).should_not be_valid
    build(:room, floor: -1).should be_valid
    build(:room, price: -434).should_not be_valid
  end
end
