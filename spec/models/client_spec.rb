require 'rails_helper'

RSpec.describe Client, type: :model do
  let!(:client) { build(:client) }

  it "has a valid factory" do
    client.should be_valid
  end

  it "has a present name" do
    build(:client, first_name: "    ", last_name: "").should_not be_valid
  end

  it "has a present first name" do
    build(:client, first_name: "  ").should_not be_valid
  end

  it "has a present last name" do
    build(:client, last_name: "    ").should_not be_valid
  end

  it "first name has most 50 characters" do
    long_name = "a" * 51
    build(:client, first_name: long_name).should_not be_valid
    shorter_name = "a" * 50
    build(:client, first_name: shorter_name).should be_valid
  end

  it "last name has most 50 characters" do
    long_name = "a" * 51
    build(:client, last_name: long_name).should_not be_valid
    shorter_name = "a" * 50
    build(:client, last_name: shorter_name).should be_valid
  end

  it "email has most 255 characters" do
    longer_mail = "m" * 252 + "@a.c"
    build(:client, email: longer_mail).should_not be_valid
    shorter_mail = "m" * 251 + "@a.c"
    build(:client, email: shorter_mail).should be_valid
  end

  it "email format is correct" do
    build(:client, email: "fe.ffwe@e").should_not be_valid
    build(:client, email: "@greger.com").should_not be_valid
    build(:client, email: "a@c.q").should be_valid
    build(:client, email: "   ").should be_valid
    build(:client, email: "gerge").should_not be_valid
  end

  it "phone number is correct" do
    build(:client, phone_number: "432 532 112").should be_valid
    build(:client, phone_number: "+38 534 23 32").should be_valid
    build(:client, phone_number: "023 423 432").should be_valid
    build(:client, phone_number: "fsdf3125hrt322f").should_not be_valid
    build(:client, phone_number: "aawFESrfeg").should_not be_valid
    build(:client, phone_number: "fs31543nji2").should_not be_valid
    build(:client, phone_number: "a").should_not be_valid
  end

end
