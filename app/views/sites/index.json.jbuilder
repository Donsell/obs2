json.array!(@sites) do |site|
  json.extract! site, :id, :user_id, :name, :latitude, :longitude, :description
  json.url site_url(site, format: :json)
end
