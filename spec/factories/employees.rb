FactoryGirl.define do
  factory :employee do
    name do
      [
          Faker::Name.first_name,
          Faker::Name.last_name,
          Faker::Name.last_name
      ].join(" ").to_cyr.gsub(/[^а-я ]+/i, "").titleize
    end
    salary { rand(100000) }
    status { true }
    contacts { [ Faker::PhoneNumber.cell_phone, Faker::Internet.email].sample }
  end
end