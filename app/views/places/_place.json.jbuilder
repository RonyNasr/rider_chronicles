json.extract! place, :id, :latitude, :longitude, :name, :address, :created_at, :updated_at
json.url place_url(place, format: :json)