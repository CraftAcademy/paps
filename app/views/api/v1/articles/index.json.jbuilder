json.data {
  json.array! @articles do |article|
    json.title article.title
    json.content article.content
  end
}
