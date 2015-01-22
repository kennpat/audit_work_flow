require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:personal_email) {|n| "user#{n}@example.com" }
    sequence(:name) {|n| "Frank N. Stein#{n}"}
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
    cycle_id 1
    project_id 1
  end

  factory :cycle do
    sequence(:cycle_name) {|n| "Cash#{n}"}
  end

  factory :task do
    sequence(:task_name) {|n| "Inventory Approach Memo#{n}"}
    priority 2
    status_id 1
    task_description 'Lorem ipsum dolor sit amet, consectetuer adipiscing'
  end

  factory :assigned_user do
    # default values, override them in the test as needed
    user_id 1
    project_id 1
  end
end
