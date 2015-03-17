json.array!(@outings) do |outing|
  json.extract! outing, :id, :user_id, :outing_date, :outing_time, :site_id, :seeing, :limiting_magnatude, :transparancy, :description
  json.url outing_url(outing, format: :json)
end
