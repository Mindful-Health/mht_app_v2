require 'spec_helper'

describe "Patients" do

	subject { page }

  describe "GET /patients" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit patients_path
      #response.status.should be(200)
      	
      it {should have_content('HR')}
      

   end
  end
end
