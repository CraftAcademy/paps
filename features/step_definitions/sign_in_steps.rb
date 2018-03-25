Given("following user exist") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end
