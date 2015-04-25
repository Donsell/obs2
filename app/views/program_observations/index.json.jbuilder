json.array!(@program_observations) do |program_observation|
  json.extract! program_observation, :id, :user_id, :program_id, :observation_id
  json.url program_observation_url(program_observation, format: :json)
end
