Given("the following categories exists") do |table|
  table.hashes.each do |category|
    create(:category, category)
  end
end

Given("the following article are assigned to categories") do |table|
  table.hashes.each do |article|
    category = Category.find_by(name: article[:category])
    article = Article.find_by(title: article[:title])
    article.categories.push category
  end
end

Given("I am on the Create Article page") do
  visit new_article_path
end

Then("I select {string} from {string}") do |category, select_box|
  select category, from: select_box
end

Then("I should be on the {string} page") do |category_name|
  category = Category.find_by(name: category_name)
  expect(page.current_path).to eq category_path(category)
end
