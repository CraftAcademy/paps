Devise.setup do |config|

   config.secret_key = '57fe46dba6f5553bf36f92864323d37e9fee6291e4fb4aac1f8bd131574ddb9bfd39cfe30231bf9d016c1e066650f268d932673337d122f58057604fac102937'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'


  require 'devise/orm/active_record'


  config.case_insensitive_keys = [:email]


  config.strip_whitespace_keys = [:email]


  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11


  config.reconfirmable = true


  config.expire_all_remember_me_on_sign_out = true


  config.password_length = 6..128


  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/


  config.reset_password_within = 6.hours


  config.sign_out_via = :delete


end
