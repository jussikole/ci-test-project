require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a name" do
    user1 = User.create!(name: "Andy", age: 50)
    
    expect(User.find_by_name("Andy").age).to eq(50)
  end
end
