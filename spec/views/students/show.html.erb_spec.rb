require 'rails_helper'

# rubocop:disable Lint/AmbiguousRegexpLiteral
RSpec.describe 'students/show.html.erb', type: :view do
  it 'shows a student' do
    assign(:student, FactoryGirl.create(:student, email: 'student_one@example.com', name: 'Student One'))

    render

    expect(rendered).to match /student_one@example.com/
    expect(rendered).to match /Student One/
  end
end
