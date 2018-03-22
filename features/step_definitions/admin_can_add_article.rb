Given("The following Admin exists") do |table|
  table.hashes.each do |admin_user|
    FactoryBot.create(:admin_user, admin_user)
  end
end

When("I click dashboard link Articles") do
  click_link('Articles')
end

When("I click admin article page link {string}") do |string|
  click_link('Create one')
end

Then("I should be on {string} dashboard page") do |string|
  visit new_admin_article_path
end

Then("I fill in field {string} with {string}") do |field, value|
  fill_in(field, with: value)
end

Then("I click article link {string}") do |string|
  click_link_or_button string
end
