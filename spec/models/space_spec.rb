require 'rails_helper'

RSpec.describe Space, type: :model do
 
    subject(:space) { described_class.new(name: "TestTitle", city: "London", address: "123 Test St", postcode: "EC9 12W", price: 150) }

  it "is valid with valid attributes" do 
    expect(space).to be_valid
  end 

  it "is it not valid without a name" do 
    space.name = nil
    expect(space).not_to be_valid
  end 

  it "is not valid witout a city" do 
    space.city = nil
    expect(space).not_to be_valid
  end

  it "is not valid without an address" do 
    space.address = nil 
    expect(space).not_to be_valid
  end 

  it "is not valid without a postcode" do 
    space.postcode = nil 
    expect(space).not_to be_valid
  end 

  it "is not valid without a price" do 
    space.price = nil 
    expect(space).not_to be_valid 
  end 

end
