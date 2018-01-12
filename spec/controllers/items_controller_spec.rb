require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      # get :index
      # expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create", type: :request do
    before(:each) do
      @category = create(:category)
    end
    it "creates new items in a category" do
      expect {
        post "/categories/#{@category.id}/items", params: { category_item: { title: 'item 1', description: 'blabla' } }
      }.to change(@category.items, :count)
    end
  end

end
