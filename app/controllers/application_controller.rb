class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

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

    private

    def set_locale
    I18n.locale = I18n.available_locales.include?(params[:locale]&.to_sym) ? params[:locale] : I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end
end
