json.array!(@telescopes) do |telescope|
  json.extract! telescope, :id, :user_id, :make, :model, :focal_length, :f_ratio, :diameter
  json.url telescope_url(telescope, format: :json)
end
