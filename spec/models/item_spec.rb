require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "tests for item model" do
    before(:each) do
      @category = create(:category)
      @item = @category.items.build(title: 'item for factory category') # Item.new(title: "test item", category_id: @category.id)
    end

    it "is valid" do
      expect(@item.valid?).to be(true)
    end

    it 'is invalid without a title' do
      @item.title = ""
      expect(@item.valid?).to be(false)
    end
  end
end
