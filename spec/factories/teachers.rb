FactoryGirl.define do
  factory :teacher do
    email { "#{name}@example.com" }
    sequence(:name) { |n| "teacher-#{n}" }
  end
end
