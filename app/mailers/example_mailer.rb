class ExampleMailer < ActionMailer::Base
  default from: "noreply@cloudencounter2.edu"

  def sample_mailer
  	mail(to: 'rndmukireland@gmail.com', subject: 'This is an email from AARS!')
  end

  def send_email_to_consultant(consultant_email_address, message)
  	@message = message
  	mail(to: consultant_email_address, subject: 'Email from a AARS User', )
  end
end
