require 'rails_helper'

RSpec.describe 'students/show.html.erb', type: :view do
  it 'shows a student' do
    assign(:student, FactoryGirl.create(:student, email: 'student_one@example.com', name: 'Student One'))

    render

    expect(rendered).to have_css 'h2', text: 'Student One'
    expect(rendered).to have_css 'dd', text: 'student_one@example.com'
    expect(rendered).to have_css 'p', text: 'No progress'
    expect(rendered).to have_link 'Set progress'
  end

  it 'shows a student with progress' do
    assign(:student, FactoryGirl.create(:student,
                                        :with_lesson_parts,
                                        email: 'student_one@example.com',
                                        name: 'Student One'))

    render

    expect(rendered).to have_css 'p', text: 'Completed up to lesson 2, part 3'
  end
end
