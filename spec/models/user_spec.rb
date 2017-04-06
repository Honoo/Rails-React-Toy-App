require 'rails_helper'

RSpec.describe User, type: :model do
  user_role = Role.create(name: "user")

  it "can create a user" do
    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test123", role_id: user_role.id)
    expect(u).to be_valid
  end

  it "requires an email" do
    u = User.create(first_name: "Jerry", last_name: "Doe", password: "test123", role_id: user_role.id)
    expect(u).to_not be_valid
  end

  it "requires a role" do
    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test123")
    expect(u).to_not be_valid
  end

  it "requires a password" do
    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", role_id: user_role.id)
    expect(u).to_not be_valid
  end

  it "requires a password of sufficient length" do
    u = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test", role_id: user_role.id)
    expect(u).to_not be_valid
  end
end
