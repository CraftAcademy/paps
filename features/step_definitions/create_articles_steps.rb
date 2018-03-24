Given("I visit the Homepage") do
  visit root_path
end

Given("show me the page") do
  save_and_open_page
end

When("I click {string} link") do |string|
  click_link_or_button string
end

Then("I fill in {string} with {string}") do |input, value|
  fill_in(input, with: value)
end

And("I click {string} button") do |string|
  click_button string
end

Then("I should be on {string} page") do |title|
  article = Article.find_by_title(title)
  expect(page.current_path).to eq article_path(article)
end

And("I should see {string}") do |string|
  expect(page).to have_content string
end

Then("I should be on article page") do
  expect(page.current_path).to eq current_path
end
