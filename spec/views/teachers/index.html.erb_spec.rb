require 'rails_helper'

# rubocop:disable Lint/AmbiguousRegexpLiteral
RSpec.describe 'teachers/index.html.erb', type: :view do
  it 'shows a list of teachers' do
    assign(:teachers, [FactoryGirl.create(:teacher, name: 'Teacher One'),
                       FactoryGirl.create(:teacher, name: 'Teacher Two')])

    render

    expect(rendered).to match /Teacher One/
    expect(rendered).to match /Teacher Two/
  end
end
