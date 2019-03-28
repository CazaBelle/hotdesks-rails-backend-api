require 'rails_helper'

RSpec.describe Space, type: :model do
  it "is valid with attributes" do 
    space = Space.new(name: "TestSpace")
    expect(space).to be_valid
  end 
  it "is it not valud without a name" do 
    space = Space.new(name: nil)
    expect(space).not_to be_valid
  end 
end
