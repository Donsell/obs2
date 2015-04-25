json.array!(@program_bodies) do |program_body|
  json.extract! program_body, :id, :program_id, :body_id
  json.url program_body_url(program_body, format: :json)
end
