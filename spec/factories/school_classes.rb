FactoryGirl.define do
  factory :school_class do
    sequence(:name) { |n| "school-class-#{n}" }
    teacher
  end
end
