require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { FactoryGirl.create(:review) }

  describe "#associations" do
    it { should belong_to(:restaurant) }
  end

  describe "#validations" do
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:description) }
  end

  describe "#initialize" do
    context "rating" do
      it "returns a review integer between 1 and 5" do
        expect(review.rating).to eq(3)
      end
    end
    it "returns a description string" do
      expect(review.description).to eq("Best mangu on earth - go get some now!")
    end
  end
end
