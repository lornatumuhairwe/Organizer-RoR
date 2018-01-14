require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'valid category objects' do
    before(:each) do
      @user = create(:user)
      # @category = Category.new(title: 'Test category', description: 'This is the test category')
      @category = @user.categories.create(title: 'Test category', description: 'This is the test category')
    end

    it "is valid" do
      expect(@category.valid?).to be(true)
    end

    it 'is invalid without the title' do
      @category.title = "  "
      expect(@category.valid?).to be(false)
    end
  end
end
