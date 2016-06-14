require 'rails_helper'

# rubocop:disable Lint/AmbiguousRegexpLiteral
RSpec.describe 'teachers/show.html.erb', type: :view do
  it 'shows a teacher' do
    assign(:teacher, FactoryGirl.create(:teacher, email: 'teacher_one@example.com', name: 'Teacher One'))

    render

    expect(rendered).to match /teacher_one@example.com/
    expect(rendered).to match /Teacher One/
  end
end
