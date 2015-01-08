require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:personal_email) {|n| "user#{n}@example.com" }
    name 'Frank N. Stein'
    job_title 'staff'
    password 'password'
    password_confirmation 'password'

  end

end
