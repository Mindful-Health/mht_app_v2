class ThresholdMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(user)
  	#@user = User.
  	#@user = User.find_by :id 1

  	@url = 'http://example.com/login'

  	#mail(to: @user.email, subject: 'Patient Vitals are Critical')
  	#mail(to: current_user.email, subject: 'Patient Vitals are Critical')

  end
end
