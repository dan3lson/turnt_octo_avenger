require 'rails_helper'

RSpec.describe RestaurantCategory, type: :model do

  let(:restaurant_category) { FactoryGirl.create(:restaurant_category) }

  describe "#associations" do
    it { should belong_to(:category) }
    it { should belong_to(:restaurant) }
  end

  describe "#validations" do
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:restaurant_id) }
  end

  describe "#initialize" do
    it "returns a category_id integer" do
      expect(restaurant_category.restaurant_id.class).to eq(Fixnum)
      expect(restaurant_category.category_id.class).to eq(Fixnum)
    end
  end
end
