require 'rails_helper'

# rubocop:disable Lint/AmbiguousRegexpLiteral
RSpec.describe 'students/index.html.erb', type: :view do
  it 'shows a list of students' do
    assign(:students, [FactoryGirl.create(:student, name: 'Student One'),
                       FactoryGirl.create(:student, name: 'Student Two')])

    render

    expect(rendered).to match /Student One/
    expect(rendered).to match /Student Two/
  end
end
