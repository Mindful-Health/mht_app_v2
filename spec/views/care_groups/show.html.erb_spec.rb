require 'spec_helper'

describe "care_groups/show" do
  before(:each) do
    @care_group = assign(:care_group, stub_model(CareGroup,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
