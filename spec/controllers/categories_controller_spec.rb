require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before(:each) do
    # @category = create(:category)
    @user = create(:user)
    @category = @user.categories.create(title: 'new category', description: 'description')
    # new_user_session_path(@user)
    # sign_in nil
  end

  describe "anonymous user" do
    it "redirects to root" do
      get :show, params: { id: @category.id }
      expect( response ).to redirect_to( new_user_session_path )
    end
  end

  describe "signed in user" do
    # let ( :user ) { User.find(1) }

    before(:each) do
      # @request.env['devise.mapping'] = Devise.mappings[:user]
      # @category = create(:category)
      sign_in @user
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

      before(:each) do
        sign_in @user
      end

      it 'adds new categories with title' do
        # post categories_path, params: { category: { title: 'T', description: 'blabla' } }
        expect do
          post categories_path, params: { category: { title: 'T', description: 'blabla' } }
        end.to change { Category.count }.by(1)
        expect(flash[:success]).to match(/Category created successfully/)

      end

      it 'doesnt add category without title' do
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
        expect(@category.reload.title).to eq('new category')
      end
    end
  end

end
