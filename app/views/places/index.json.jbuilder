json.places(@places) do |place|
  json.id place.id
  json.name place.name
  json.miles place.miles
end
