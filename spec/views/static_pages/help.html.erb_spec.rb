require 'rails_helper'

RSpec.describe "static_pages/help.html.erb", type: :view do
  it "renders the help page" do
    render
    expect(rendered).to match /Help/
  end
end
