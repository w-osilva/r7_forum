json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :topic_id, :comment_id
  json.url comment_url(comment, format: :json)
end
