Given("the following user exists") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end

Given("I am logged in as {string}") do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end
