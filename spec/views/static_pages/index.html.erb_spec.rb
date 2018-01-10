require 'rails_helper'

RSpec.describe "static_pages/index.html.erb", type: :view do # path to the view
  it 'renders' do
    render
    expect(rendered).to match /Organiza/ # text expected in the view
  end
end
