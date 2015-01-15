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

  factory :project do
    sequence(:project_name) {|n| "Launch Academy 201#{n} Audit"}
    project_type 'Education'
    status 'Active'
    stage 'Planning'
  end

  factory :project_cycle do
  
  end

  factory :cycle do
    sequence(:cycle_name) {|n| "Cash#{n}"}
  end
end
