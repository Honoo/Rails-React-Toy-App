require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires an email" do
    u = User.create(first_name: "Jerry", last_name: "Doe", password: "test123")
    expect(u).to_not be_valid

    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test123")
    expect(u).to be_valid
  end

  it "requires a password" do
    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com")
    expect(u).to_not be_valid

    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test123")
    expect(u).to be_valid
  end

  it "requires a password of sufficient length" do
    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test")
    expect(u).to_not be_valid

    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test123")
    expect(u).to be_valid
  end
end
