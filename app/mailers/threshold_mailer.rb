class ThresholdMailer < ActionMailer::Base
  default from: "mindful.health.technologies@gmail.com"

<<<<<<< HEAD
  def notification_email(current_user)
  	@user = current_user
  	@resource = current_resource
  	@url = 'http://localhost:3000/users/sign_in'

  	mail(:to => current_user.email, :subject => 'Patient Vitals are Critical')
=======
  def notification_email(user)
  	#@user = User.
  	#@user = User.find_by :id 1

  	@url = 'http://example.com/login'

  	#mail(to: @user.email, subject: 'Patient Vitals are Critical')
  	#mail(to: current_user.email, subject: 'Patient Vitals are Critical')
>>>>>>> 0e520fb5fa73b74abda8e33d28d7a4ec6eb19672

  end
end
