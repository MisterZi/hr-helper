FactoryGirl.define do
  factory :vacancy do
    name              { Faker::Name.title }
    expiration_date   { Faker::Business.credit_card_expiry_date }
    salary            { rand(100000) }
    contacts          { Faker::PhoneNumber.cell_phone }
  end
end