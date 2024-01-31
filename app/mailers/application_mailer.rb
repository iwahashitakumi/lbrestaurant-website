class ApplicationMailer < ActionMailer::Base
  default from: ENV['HOMEPAGE_EMAIL']
  layout "mailer"
end
