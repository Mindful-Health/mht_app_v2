 Feature: Sign up 

  Scenario: Successful sign up and e-mail
     Given one visitor
     And the visitor filled all the required fields
     When the visitor click signup button
     Then one new user created
     And the new user should receive an email confirmation