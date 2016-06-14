require 'rails_helper'

RSpec.describe 'students/index.html.erb', type: :view do
  it 'shows a list of students' do
    assign(:students, [FactoryGirl.create(:student, name: 'Student One'),
                       FactoryGirl.create(:student, name: 'Student Two')])

    render

    expect(rendered).to have_link 'Student One'
    expect(rendered).to have_link 'Student Two'
  end

  it 'shows a student with no progress' do
    assign(:students, [FactoryGirl.create(:student)])

    render

    expect(rendered).to have_css 'span.label.label-success', text: '0'
    expect(rendered).to have_css 'span.label.label-default', text: '0'
  end

  it 'shows a student with progress' do
    assign(:students, [FactoryGirl.create(:student, :with_lesson_parts)])

    render

    expect(rendered).to have_css 'span.label.label-success', text: '2'
    expect(rendered).to have_css 'span.label.label-default', text: '3'
  end
end
