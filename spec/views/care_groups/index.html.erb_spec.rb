require 'spec_helper'

describe "care_groups/index" do
  before(:each) do
    assign(:care_groups, [
      stub_model(CareGroup,
        :name => "Name"
      ),
      stub_model(CareGroup,
        :name => "Name"
      )
    ])
  end

  it "renders a list of care_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
