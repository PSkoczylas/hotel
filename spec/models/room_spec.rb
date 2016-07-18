require 'rails_helper'

RSpec.describe Room, type: :model do
  let!(:room) { build(:room) }

  it "has a valid factory" do
    room.should be_valid
  end


end
