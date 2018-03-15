Given("I visit the site") do
  visit root_path
end

Then("I click {string}") do |string|
  click_button string
end

Then("I fill {string} with {string}") do |input, value|
  fill_in input, with: value
end

Then("I should see message {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("show me the page") do
  save_and_open_page
end
