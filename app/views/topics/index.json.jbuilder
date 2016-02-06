json.array!(@topics) do |topic|
  json.extract! topic, :id, :text
  json.url topic_url(topic, format: :json)
end
