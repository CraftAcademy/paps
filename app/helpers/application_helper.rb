module ApplicationHelper
  def fake_location
    ({coords: Rails.application.config.try(:fake_location).try(:to_hash)}).to_json
 end
end
