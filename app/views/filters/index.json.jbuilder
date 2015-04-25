json.array!(@filters) do |filter|
  json.extract! filter, :id, :make, :model
  json.url filter_url(filter, format: :json)
end
