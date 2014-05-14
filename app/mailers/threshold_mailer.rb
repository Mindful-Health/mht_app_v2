class ThresholdMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(user)
  	@user = user
  	@url = 'http://example.com/login'

  	mail(to: @user.email, subject: 'Patient Vitals are Critical')

  end
end
