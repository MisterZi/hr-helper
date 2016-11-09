FactoryGirl.define do
  factory :employee do
    name { 'тест тест тест' }
    salary { rand(100000) }
    status { true }
    contacts { Faker::Internet.email }
  end
end