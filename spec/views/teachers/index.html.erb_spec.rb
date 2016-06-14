require 'rails_helper'

RSpec.describe 'teachers/index.html.erb', type: :view do
  it 'shows a list of teachers' do
    assign(:teachers, [FactoryGirl.create(:teacher, name: 'Teacher One'),
                       FactoryGirl.create(:teacher, name: 'Teacher Two')])

    render

    expect(rendered).to have_link 'Teacher One'
    expect(rendered).to have_link 'Teacher Two'
  end
end
