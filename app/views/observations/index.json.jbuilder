json.array!(@observations) do |observation|
  json.extract! observation, :id, :user_id, :outing_id, :body_id, :obs_date, :obs_time, :seeing, :transparency, :telescope_id, :eyepiece_id, :filter_id, :note
  json.url observation_url(observation, format: :json)
end
