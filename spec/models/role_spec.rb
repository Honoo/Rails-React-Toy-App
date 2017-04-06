require 'rails_helper'

RSpec.describe Role, type: :model do
  it "must have a unique name" do
    r1 = Role.create(name: "test")
    expect(r1).to be_valid
    r2 = Role.create(name: "test")
    expect(r2).to_not be_valid
  end

  it "can be assigned to multiple users" do
    role = Role.create(name: "test")
    u1 = User.create(first_name: "Jerry", last_name: "Doe", email: "jerry_doe@test.com", password: "test123", role_id: role.id)
    u2 = User.create(first_name: "Jake", last_name: "Doe", email: "jake_doe@test.com", password: "test123", role_id: role.id)
    expect(u1).to be_valid
    expect(u2).to be_valid
  end
end
