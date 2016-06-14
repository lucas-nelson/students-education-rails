require 'rails_helper'

RSpec.describe 'teachers/teaches_students/index.html.erb', type: :view do
  let(:teacher) { FactoryGirl.create(:teacher, name: 'Teacher One') }

  it 'shows a list of students' do
    assign(:students, [FactoryGirl.create(:student, name: 'Student One'),
                       FactoryGirl.create(:student, name: 'Student Two')])
    assign(:teacher, teacher)

    render

    expect(rendered).to have_css 'h2', text: 'Students taught by Teacher One'
    expect(rendered).to have_link 'Student One'
    expect(rendered).to have_link 'Student Two'
  end

  it 'shows a student with no progress' do
    assign(:students, [FactoryGirl.create(:student)])
    assign(:teacher, teacher)

    render

    expect(rendered).to have_css 'span.label.label-success', text: '0'
    expect(rendered).to have_css 'span.label.label-default', text: '0'
  end

  it 'shows a student with progress' do
    assign(:students, [FactoryGirl.create(:student, :with_lesson_parts)])
    assign(:teacher, teacher)

    render

    expect(rendered).to have_css 'span.label.label-success', text: '2'
    expect(rendered).to have_css 'span.label.label-default', text: '3'
  end
end
