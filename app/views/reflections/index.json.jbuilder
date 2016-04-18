json.array!(@reflections) do |reflection|
  json.extract! reflection, :id, :user_id, :entry_type, :feels, :body, :ip_address, :latitude, :longitude
  json.url reflection_url(reflection, format: :json)
end
