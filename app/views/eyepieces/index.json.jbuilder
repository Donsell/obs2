json.array!(@eyepieces) do |eyepiece|
  json.extract! eyepiece, :id, :user_id, :make, :model, :focal_length, :afov
  json.url eyepiece_url(eyepiece, format: :json)
end
