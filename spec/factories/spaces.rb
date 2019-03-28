#Faker will generate dynamic data every time that factory is invoked

FactoryBot.define do
  factory :space do
    name { Faker::Company.name }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    postcode { Faker::Address.postcode }
    price { Faker::Number.decimal(2) }
  end
end
