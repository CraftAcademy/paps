Given("I am at latitude: {float}, longitude: {float}") do |lat, lng|
  Rails.application.config.fake_location = { latitude: lat, longitude: lng }
end
