# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# safety valve
raise ActiveRecord::ProtectedEnvironmentError unless Rails.env.development? || ENV['DISABLE_DATABASE_ENVIRONMENT_CHECK']

# get the first N lesson parts by lesson.ordinal and lesson_part.ordinal for
# the given school_class
# this is used to set the completion for a student between 0 and 299 lesson
# parts
def random_completion(school_class)
  num_lessons = rand(300)
  LessonPart
    .joins(:lesson)
    .where(lessons: { school_class_id: school_class })
    .order('lessons.ordinal', 'lesson_parts.ordinal')
    .limit(num_lessons)
end

# join some fake words together with a space and capitalize the first letter
def words(num)
  Faker::Lorem.words(num, true).join(' ').humanize
end

# teachers
edna = Teacher.create!(email: 'edna_krabappel@example.org', name: 'Edna Krabappel')
elizabeth = Teacher.create!(email: 'elizabeth_hoover@example.org', name: 'Elizabeth Hoover')

# school_classes
second_grade = SchoolClass.create!(name: 'Second grade', teacher: elizabeth)
fourth_grade = SchoolClass.create!(name: 'Fourth grade', teacher: edna)

# lessons and lesson_parts for each class
SchoolClass.find_each do |school_class|
  100.times do |idx|
    lesson_parts = Array.new(3) { |lp_idx| LessonPart.new(name: "#{lp_idx + 1}. #{words(5)}", ordinal: lp_idx + 1) }
    Lesson.create!(lesson_parts: lesson_parts,
                   name: "#{idx + 1}. #{words(3)}",
                   ordinal: idx + 1,
                   school_class: school_class)
  end
end

# students and completions
Student.create!(email: 'bart_simpson@example.net', name: 'Bart Simpson', school_class: second_grade)
# Lisa is in the fourth grade and has completed all her lessons
Student.create!(email: 'lisa_simpson@example.net',
                lesson_parts: fourth_grade.lessons.map(&:lesson_parts).flatten,
                name: 'Lisa Simpson',
                school_class: fourth_grade)
# fill out the rest of the classes (total 20 students per class)
SchoolClass.find_each do |school_class|
  19.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.safe_email("#{first_name}_#{last_name}")

    Student.create!(email: email,
                    lesson_parts: random_completion(school_class),
                    name: "#{first_name} #{last_name}",
                    school_class: school_class)
  end
end
