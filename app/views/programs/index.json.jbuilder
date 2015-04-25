json.array!(@programs) do |program|
  json.extract! program, :id, :name, :desc, :num_silver, :num_gold
  json.url program_url(program, format: :json)
end
