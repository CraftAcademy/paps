class ApplicationController < ActionController::Base

    def current_user
      super || create_guest_user
    end

    def create_guest_user
      token = SecureRandom.base64(15)
      user = User.new({password: token, email: "#{token}@example.com"}.merge!(@coordinates))
      user.address = Geocoder.address([@coordinates.values.first, @coordinates.values.second])
      user.save(validate: false)
      user
    end
end
