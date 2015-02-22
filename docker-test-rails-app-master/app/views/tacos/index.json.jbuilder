json.array!(@tacos) do |taco|
  json.extract! taco, :id, :flavor, :vendor, :rating
  json.url taco_url(taco, format: :json)
end
