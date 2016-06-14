require 'rails_helper'

# rubocop:disable Lint/AmbiguousRegexpLiteral
RSpec.describe 'students/completed_lesson_parts/new.html.erb', type: :view do
  let(:school_class) { FactoryGirl.create :school_class }
  let(:lesson) { FactoryGirl.create :lesson, ordinal: 1, school_class: school_class }
  let(:student) { FactoryGirl.create :student, name: 'Unique Name', school_class: school_class }

  it 'shows the student and progress' do
    student.lesson_parts << FactoryGirl.create(:lesson_part, lesson: lesson, ordinal: 1)
    student.lesson_parts << FactoryGirl.create(:lesson_part, lesson: lesson, ordinal: 2)
    assign(:student, student)

    render

    expect(rendered).to match /Unique Name/
    expect(rendered).to match /Completed up to lesson 1, part 2/
  end

  it 'shows no progress' do
    assign(:student, FactoryGirl.create(:student))

    render

    expect(rendered).to match /No progress/
  end
end
