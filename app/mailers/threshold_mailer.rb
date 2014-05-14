class ThresholdMailer < ActionMailer::Base
  default from: "mindful.health.technologies@gmail.com"


  def notification_email(current_user)
  	@user = current_user
  	@resource = current_resource
  	@url = 'http://localhost:3000/users/sign_in'

  	mail(:to => current_user.email, :subject => 'Patient Vitals are Critical')

  end
end
