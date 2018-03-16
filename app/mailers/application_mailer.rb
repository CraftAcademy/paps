class ApplicationMailer < ActionMailer::Base
  default from: 'obama@whitehouse.gov'

  def test_email(user)
    mail(to: user.email, subject: 'Welcome to PAPs')
  end
end
