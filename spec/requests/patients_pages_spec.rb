require 'spec_helper'

describe "Patient Pages" do

	subject { page }

	describe "index" do
		let(:patient) {FactoryGirl.create(:patient)}
		before {visit patients_path}

		it { should have_title('Patient Index') }
		
	end #end index page

	describe "edit" do
		
		let(:patient) {FactoryGirl.create(:patient)}
  		before { visit edit_patient_path(patient)}

	end #end edit

	describe "new" do
		let(:patient) {FactoryGirl.create(:patient)}
		before {visit new_patient_path}

	end #end new page

	describe "show" do
		let(:patient) {FactoryGirl.create(:patient)}
		it {should have_button ('24 Hours')}
		before do
			visit patient_path(patient)
			click_button "24 Hours"
		end

		it {should have_selector('#placeholder')}

	end


  #describe "Individual Patient Page" do
    
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #before {visit @patient.page }
      #response.status.should be(200)
      	
      #it {should have_content('HR')}
      

   
  #end
end
