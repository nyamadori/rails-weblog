json.array!(@articles) do |article|
  json.extract! article, :id
  json.extract! article, :title
  json.extract! article, :body
  json.extract! article, :published_at
  json.url article_url(article, format: :json)
end
