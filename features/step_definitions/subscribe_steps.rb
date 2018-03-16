Given("I am on the create subscription page") do
  visit new_subscription_path
end

Given("submit the stripe form") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("{string} should be a subscriber") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

And(/^I click on the "([^"]*)" button$/) do |button|
  click_button button
  sleep(5)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
end
