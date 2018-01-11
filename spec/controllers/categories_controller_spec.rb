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

  describe "add category methods", type: :request do

    it 'adds new categories with title' do
    expect do
      post categories_path, params: { category: { title: 'T', description: 'blabla' } }
    end.to change(Category, :count)
    end

    it 'doesnt add category with title' do
      expect do
        post categories_path, params: { category: { title: '', description: 'blabla' } }
      end.not_to change(Category, :count)
    end
  end

  describe "deletes category", type: :request do
    it 'deletes one category' do
      category_id = @category.id
      expect do
        delete "/categories/#{category_id}"
      end.to change(Category, :count)
    end
  end

  describe 'updates category', type: :request do
    before { put "/categories/#{@category.id}", params: { category: { title: 'tester', description: 'the description' } }}
     it 'updates one category' do
       expect(@category.reload.title).to eq('tester')
     end
  end

  describe 'cannot update category without title', type: :request do
    before { put "/categories/#{@category.id}", params: { category: { title: '', description: 'the description' } }}
    it 'updates one category' do
      expect(@category.reload.title).to eq('Factory category')
    end
  end

end
