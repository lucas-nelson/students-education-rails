FactoryGirl.define do
  factory :lesson_part do
    lesson
    sequence(:name) { |n| "lesson part #{n}" }
    sequence(:ordinal) { |n| n % 3 + 1 }

    trait :with_students do
      after(:create) { |lesson_part| lesson_part.students << create(:student) }
    end
  end
end
