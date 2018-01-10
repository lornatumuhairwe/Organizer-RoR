require 'rails_helper'

RSpec.describe "static_pages/about.html.erb", type: :view do
  it "renders the about page" do
    render
    expect(rendered).to match /About/
  end
end
