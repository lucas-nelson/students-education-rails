require 'rails_helper'

# rubocop:disable Lint/AmbiguousRegexpLiteral
RSpec.describe 'static_pages/index.html.erb', type: :view do
  it 'shows the heading' do
    render

    expect(rendered).to match /Students education rails/
  end
end
