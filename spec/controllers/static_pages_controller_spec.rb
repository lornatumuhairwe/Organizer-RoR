require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  before(:each) do
    sign_in create(:user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #help' do
    it 'returns http success' do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #about' do
    it 'returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #root' do
    it 'returns http success' do
      expect(get: root_url).to route_to(
        controller: 'static_pages',
        action: 'index')
    end
  end

end
