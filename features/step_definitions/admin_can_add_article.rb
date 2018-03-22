Given("The following Admin exists") do |table|
  table.hashes.each do |admin_user|
    FactoryBot.create(:admin_user, admin_user)
  end
end

Given("I'm logged in as the admin") do
  login_as @admin, scope: :admin_user
end

Given("I go to the dashboard") do
  visit admin_dashboard_path
end

When("I click dashboard link Articles") do
  find_link('Articles').click
end

When("I click article link {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I fill in field article_title") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I fill in field article_content") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I click article link {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
