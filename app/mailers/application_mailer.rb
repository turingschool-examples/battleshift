class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@battleshift.hello'
  layout 'mailer'
end
