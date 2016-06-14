require 'rails_helper'

RSpec.feature 'Student progress', type: :feature do
  let(:school_class) { FactoryGirl.create :school_class }
  let(:lesson) { FactoryGirl.create :lesson, ordinal: 1, school_class: school_class }
  let!(:lesson_part) { FactoryGirl.create :lesson_part, lesson: lesson, ordinal: 1 }
  let!(:second_lesson_part) { FactoryGirl.create :lesson_part, lesson: lesson, ordinal: 2 }
  let(:student) do
    FactoryGirl.create(:student, email: 'student_one@example.com', name: 'Student One', school_class: school_class)
  end
  let(:student_with_progress) do
    FactoryGirl.create(:student,
                       email: 'student_two@example.com',
                       name: 'Student Two',
                       lesson_parts: [lesson_part],
                       school_class: school_class)
  end

  scenario 'add progress to a student with no progress' do
    visit student_path(student)

    expect(page).to have_content 'Student One'
    expect(page).to have_content 'student_one@example.com'
    expect(page).to have_content 'No progress'
    expect(page).to have_link 'Set progress', href: new_student_completed_lesson_part_path(student_id: student)

    click_link 'Set progress'

    expect(page).to have_content 'Student One'
    expect(page).to have_content 'No progress'

    fill_in 'lesson_ordinal', with: 1
    fill_in 'lesson_part_ordinal', with: 1
    click_button 'Save'

    expect(page).to have_content 'New progress saved.'
    expect(page).to have_content 'Completed up to lesson 1, part 1'
  end

  scenario 'add more progress to a student' do
    visit student_path(student_with_progress)

    expect(page).to have_content 'Completed up to lesson 1, part 1'
    expect(page).to have_link 'Set progress',
                              href: new_student_completed_lesson_part_path(student_id: student_with_progress)

    click_link 'Set progress'

    expect(page).to have_content 'Completed up to lesson 1, part 1'

    fill_in 'lesson_ordinal', with: 1
    fill_in 'lesson_part_ordinal', with: 2
    click_button 'Save'

    expect(page).to have_content 'New progress saved.'
    expect(page).to have_content 'Completed up to lesson 1, part 2'
  end
end
