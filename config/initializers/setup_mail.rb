# if Rails.env.development? || Rails.env.production?
#   ActionMailer::Base.delivery_method = :smtp
#   ActionMailer::Base.smtp_settings = {
#     address:        'smtp.sendgrid.net',
#     port:           '2525',
#     authentication: :plain,
#     user_name:      ENV["SENDGRID_USERNAME"],
#     password:       ENV["SENDGRID_PASSWORD"],
#     domain:         'heroku.com',
#     enable_startttls_auto: true
#
#   }
# end

if Rails.env.development? || Rails.env.production?
  # https://www.bloc.io/resources/mailgun-integration
  ActionMailer::Base.smtp_settings = {
    port:              587,
    address:           'smtp.mailgun.org',
    user_name:         ENV['MAILGUN_SMTP_LOGIN'],
    password:          ENV['MAILGUN_SMTP_PASSWORD'],
    domain:            'appe8f2b18facf9430eaf2706e477ef0e93.mailgun.org',
    authentication:    :plain,
    content_type:      'text/html'
  }
  ActionMailer::Base.delivery_method = :smtp

  # Makes debugging *way* easier.
  ActionMailer::Base.raise_delivery_errors = true
end

# This interceptor just makes sure that local mail
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'Rothstein.Andrew@gmail.com'
    message.cc = nil
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end