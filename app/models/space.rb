class Space < ApplicationRecord
  validates_presence_of :name, :city, :address, :postcode, :price
end
