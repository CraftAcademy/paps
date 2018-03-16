Given("I visit the {string} page") do |string|
  visit root_path
end

When("I click {string} link") do |string|
  click_link_or_button string
end

When("I fill in {string} with {string}") do |input, value|
  fill_in(input, with: value)
end

When("I click {string} button") do |string|
  click_button string
end
