class Place < ApplicationRecord
  serialize :categories, Array
  
  scope :find_by_category, -> (category) { where("categories LIKE ?", "% #{category.downcase}\n%") }
  scope :find_places_within_miles, -> (miles) { where("miles <= ?", miles) }
  scope :find_by_name, -> (name) { where("name ILIKE ?", "%#{name.downcase}%") }

  def self.find_places_with_category(category)
    if category == ""
      Place.all
    else
      find_by_category(category)
    end
  end

  def self.find_places_with_name(name)
    if name == ""
      Place.all
    else
      find_by_name(name)
    end
  end
end
