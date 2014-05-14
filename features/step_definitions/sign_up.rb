Given "one visitor" do
  @name = "my_name"
  @email = "test@example.com"
  @password = "coolpass"
  @password_confirmation = "coolpass"
end

Given "the visitor filled all the required fields" do
  @params = {:user => {:name => @name, :email => @email, :password => @password, :password_confirmation => @password_confirmation}}
end

When "the visitor click signup button" do
  # add this 3 lines for a startup
  # make your delivery state to 'test' mode
  ActionMailer::Base.delivery_method = :test
  # make sure that actionMailer perform an email delivery
  ActionMailer::Base.perform_deliveries = true
  # clear all the email deliveries, so we can easily checking the new ones
  ActionMailer::Base.deliveries.clear
# post 'user_session_url', @params
#end


  User.new(:name => @name, :email => @email, :password => @password, :password_confirmation => @password_confirmation).save!

  visit '/users/sign_in'
  #fill_in "name", :with => @name
  #fill_in "email", :with => @email
  #fill_in "password", :with => @password
  #fill_in "password_confirmation", :with => @password_confirmation

  click_button "Sign in"

end

Then "one new user created" do
  @user = User.find_by_email(@email)
  @user.should_not be_nil
end

Then "the new user should receive an email confirmation" do
  # this will get the first email, so we can check the email headers and body.
  @email = ActionMailer::Base.deliveries.first
  #@email.from.should == 'mindful.health.technologies@gmail.com'
  #@email.to.should == @user.email
  #@email.body.should include("alert")
end