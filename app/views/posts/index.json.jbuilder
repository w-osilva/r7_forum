json.array!(@posts) do |post|
  json.extract! post, :id, :text, :type
  json.url post_url(post, format: :json)
end
