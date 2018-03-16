Given("following article exists") do |table|
  table.hashes.each do |article|
    FactoryBot.create(:article, article)
  end
end

Given("I am on the {string} page") do |title|
  article = Article.find_by_title(title)
  visit(article_path(article))
end

Then("I should be on the {string} page") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
