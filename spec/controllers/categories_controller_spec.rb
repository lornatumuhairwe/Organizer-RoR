require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  before(:each) do
    @category = create(:category)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @category.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "add category methods", :type => :request do
    it 'adds new categories with title' do
    expect {
      post categories_path, params: { category: { title: 'T', description: 'blabla' } }
    }.to change(Category, :count)
    end

    it 'doesnt add category with title' do
      expect {
        post categories_path, params: { category: { title: '', description: 'blabla' } }
      }.not_to change(Category, :count)
    end
  end

end
