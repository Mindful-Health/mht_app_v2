Given /^a user visits a patient page$/ do
  visit patient_path(1)
end

When /^they press 24 hour button$/ do
  click_button "24 Hours"
end

Then /^they should see a graph with 24 hours of data$/ do
  expect(page).to have_selector('div.alert.alert-error')
end
