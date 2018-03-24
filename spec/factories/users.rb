FactoryBot.define do
  factory :user do
    email 'hejhej@test.se'
    password 'password123'
    longitude 1.2
    latitude 2.3
    address "Holgergatan"
  end
end
