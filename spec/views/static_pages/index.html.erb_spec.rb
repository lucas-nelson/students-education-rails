require 'rails_helper'

RSpec.describe 'static_pages/index.html.erb', type: :view do
  it 'shows the heading' do
    render

    expect(rendered).to have_css('h1', text: 'Students education rails')
  end
end
