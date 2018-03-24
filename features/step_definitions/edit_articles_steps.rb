Given("the following article exists") do |table|
  table.hashes.each do |article|
    FactoryBot.create(:article, article)
  end
end

Given("I am on the {string} page") do |title|
  article = Article.find_by_title(title)
  visit(article_path(article))
end
