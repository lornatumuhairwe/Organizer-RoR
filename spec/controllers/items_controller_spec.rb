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
      @item = @category.items.create(title: 'Stuff', description: 'The ambigous things about my life')
    end
    it "creates new items in a category" do
      expect {
        post "/categories/#{@category.id}/items", params: { category_item: { title: 'item 1', description: 'blabla' } }
      }.to change(@category.items, :count)
    end

    describe "PUT #update", type: :request do
      before { put "/categories/#{@category.id}/items/#{@item.id}", params: { item: { title: 'item 2' }}}
      it 'updates existing item' do
        expect(@item.reload.title).to eq('item 2')
      end
    end

    describe "DELETE #destroy", type: :request do
    it "deletes a category item" do
      expect do
        delete "/categories/#{@category.id}/items/#{@item.id}"
      end.to change(@category.items, :count)
    end
    end

  end

end
