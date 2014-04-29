require 'spec_helper'

describe "patients/show" do

  
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :condition => "MyText",
      :deviceId => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
 
 #it "should have a graph" do
  #  visit 'patients/1'
  #  expect(page).to have_content('HR')
    #it {should have_content'HR'}

 # end


end
