require 'spec_helper'

describe "CareGroup Pages" do

	subject {page}

	describe "index" do
		let(:care_group) {FactoryGirl.create(:care_group)}
		before {visit care_groups_path}
		it { should have_title('Listing All Care Groups') }
	end #end of care group index

	describe "edit" do
		let(:care_group) {FactoryGirl.create(:care_group)}
		before {visit edit_care_group_path(care_group)}

	end #end edit care group

	describe "new" do
		let(:care_group) {FactoryGirl.create(:care_group)}
		before {visit new_care_group_path}

	end #end new

	describe "show" do
		let(:care_group) {FactoryGirl.create(:care_group)}
		before {visit care_group_name(care_group)}

	end #end show


  #describe "GET /care_groups" do
  #  it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #    get care_groups_path
  #    response.status.should be(200)
  #  end
  #nd
end
