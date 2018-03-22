Given("the following categories exists") do |table|
  table.hashes.each do |category|
    create(:category, category)
  end
end

Given("I am on the Create Article page") do
  visit new_article_path
end

Then("I select {string} from {string}") do |category, select_box|
  select(category, from: select_box)
end
