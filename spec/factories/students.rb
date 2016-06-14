FactoryGirl.define do
  factory :student do
    email { "#{name}@example.com" }
    sequence(:name) { |n| "student-#{n}" }
    school_class

    trait :with_lesson_parts do
      transient do
        # how many groups of 3 completed lesson parts should be created?
        lesson_parts_groups_count 2
      end

      after(:create) do |student, evaluator|
        # this is more complicated than a straight `create_list` so we can get
        # the same lesson reference in each group of three lesson parts
        evaluator.lesson_parts_groups_count.times do |idx|
          lesson = create(:lesson, ordinal: idx + 1)
          3.times do |parts_idx|
            student.lesson_parts << create(:lesson_part, lesson: lesson, ordinal: parts_idx + 1)
          end
        end
      end
    end
  end
end
