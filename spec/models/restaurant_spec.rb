require "rails_helper"

RSpec.describe Restaurant, type: :model do

  let(:description) { "We make the best mangu in the universe." }
  let(:category) { Category.create(name: "Dominican") }
  let(:restaurant) { Restaurant.create(
    name: "Mangu",
    street1: "123 Main St",
    street2: "Apt 3",
    city: "Bronx",
    state: "NY",
    zipcode: "10473",
    description: description
    )
  }

  describe "#associations" do
    it { should have_many(:categories) }
    it { should have_many(:restaurant_categories) }
    it { should have_many(:reviews) }
  end

  describe "#validations" do
    it { should validate_presence_of(:name) }
    subject { Restaurant.new(
        street1: "street1",
        street2: "street2",
        city: "city",
        state: "state",
        zipcode: "zipcode",
      )
    }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:street1) }
    it { should validate_presence_of(:street2) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
  end

  describe "#initialize" do
    context "restaurant has a name" do
      it "returns a string" do
        expect(restaurant.name).to eq("Mangu")
      end
    end

    context "restaurant has an address" do
      it "returns a string" do
        expect(restaurant.street1).to eq("123 Main St")
      end
      it "returns a string" do
        expect(restaurant.street2).to eq("Apt 3")
      end
      it "returns a string" do
        expect(restaurant.city).to eq("Bronx")
      end
      it "returns a string" do
        expect(restaurant.state).to eq("NY")
      end
      it "returns a string" do
        expect(restaurant.zipcode).to eq("10473")
      end
    end

    context "restaurant description" do
      describe "restaurant does not have a description" do
        let(:description) { "" }
        it "returns an empty string" do
          expect(restaurant.description).to eq("")
        end
      end
      describe "restaurant does have a description" do
        it "returns a description string" do
          expect(restaurant.description).to eq("We make the best mangu in the universe.")
        end
      end
    end

    context "restaurant category" do
      describe "restaurant does not have a category" do
        it "returns 0" do
          expect(restaurant.categories.count).to eq(0)
        end
      end
      describe "restaurant does have a category" do
        it "returns a category string" do
          restaurant.categories << category
          expect(restaurant.categories.count).to eq(1)
        end
      end
    end
  end
end
