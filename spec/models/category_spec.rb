require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create(:category) }

  describe "#associations" do
    it { should have_many(:restaurant_categories) }
    it { should have_many(:restaurants) }
  end

  describe "#validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "#initialize" do
    it "returns a category name" do
      expect(category.name).to eq("Dominican")
    end
  end
end
