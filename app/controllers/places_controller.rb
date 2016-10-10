class PlacesController < ApplicationController
  def index
    default_values
    @places = Place.find_places_with_category(params[:category])
                   .find_places_within_miles(params[:miles])
                   .find_places_with_name(params[:name])
  end

  private

  def default_values
    params[:name] = "" unless params[:name]
    params[:category] = "" unless params[:category]
    params[:miles] = 10000 unless params[:miles]
  end
end
