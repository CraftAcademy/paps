Geocoder.configure(
    timeout: 3,
    lookup: :google,
    api_key: Rails.application.credentials.geocoder[:api_key],
    units: :km,
)
