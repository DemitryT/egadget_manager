require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password "password"
    password_confirmation "password"
  end
end
