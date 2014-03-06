require 'spec_helper'

describe "care_groups/index" do
  before(:each) do
    assign(:care_groups, [
      stub_model(CareGroup,
        :user_id => 1,
        :patient_id => 2
      ),
      stub_model(CareGroup,
        :user_id => 1,
        :patient_id => 2
      )
    ])
  end

  it "renders a list of care_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
