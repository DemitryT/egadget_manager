require 'faker'

FactoryGirl.define do
  factory :gadget do |f|
    f.name { Faker::Lorem.word }
    f.manufacturer { Faker::Company.name }
  end
end
