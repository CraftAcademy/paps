Given("I visit the site") do
  visit root_path
end

Then("I click {string}") do |string|
  click_button string
end

Then("I fill {string} with {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see message {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end


When("I fill {string} with {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end
