require 'rails_helper'

RSpec.describe Place, type: :model do
  before(:each) do
    Place.create(name: "Subway", categories: ["fast food"], miles: 3 )
    Place.create(name: "Happy", categories: ["restaurant", "coffee"], miles: 5)
    Place.create(name: "Starbucks", categories: ["coffee", "fast food"], miles: 2)
  end

  describe "#find_places_with_category" do
    it "show places by that category" do
      expect(Place.find_places_with_category("fast food").map(&:name)).to eq(["Subway", "Starbucks"])
    end
  end

  describe "#find_places_within_miles" do
    it "finds a place within miles" do 
      expect(Place.find_places_within_miles(3).map(&:name)).to eq(["Subway", "Starbucks"])
    end
  end

  describe "#find_places_with_name" do
    it "finds a place by name " do
      expect(Place.find_places_with_name("subway").map(&:name)).to eq(["Subway"])
    end
  end

  describe "combine all scopes" do
    it "combines all searching scopes" do
      expect(Place.find_places_with_category("fast food")
                  .find_places_within_miles(2)
                  .find_places_with_name("")
                  .map(&:name)).to eq(["Starbucks"])
    end
  end
end
