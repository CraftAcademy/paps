Given("I am at latitude: {string}, longitude: {string}") do |lat, lng|
  Rails.application.config.fake_location = { latitude: lat, longitude: lng }
end
