Given("following user exist") do |table|
  table.hashes.each do |user|
    FactoryBot.create(:user, user)
  end
end

When("I fill in {string} with {string}") do |input, value|
  fill_in input, with: value
end

Then("I should see {string}") do |string|

end