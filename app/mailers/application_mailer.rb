class ApplicationMailer < ActionMailer::Base
  default from: 'obama@whitehouse.gov'
  layout false

  def test_email(user)
    mail(to: user.email, subject: 'Welcome to PAPs')
  end
end
