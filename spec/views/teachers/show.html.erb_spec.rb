require 'rails_helper'

RSpec.describe 'teachers/show.html.erb', type: :view do
  it 'shows a teacher' do
    assign(:teacher, FactoryGirl.create(:teacher, email: 'teacher_one@example.com', name: 'Teacher One'))

    render

    expect(rendered).to have_css 'h2', text: 'Teacher One'
    expect(rendered).to have_css 'dd', text: 'teacher_one@example.com'
    expect(rendered).to have_link 'Students taught'
  end
end
