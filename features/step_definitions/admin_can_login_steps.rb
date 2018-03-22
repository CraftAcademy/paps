Given("The following user exists") do |table|
 table.hashes.each do |user|
   FactoryBot.create(:user, user)
 end
end

Given("I am on the Admin login page") do
 visit new_admin_user_session_path
end

Then("I click submit") do
 find_button('Login').click
end

Then("I should be redirected to admin dashboard") do
 visit admin_root_path
end
