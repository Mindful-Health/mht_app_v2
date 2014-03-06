require 'spec_helper'

describe "patients/index" do
  before(:each) do
    assign(:patients, [
      stub_model(Patient,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :condition => "MyText",
        :deviceId => 1
      ),
      stub_model(Patient,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :condition => "MyText",
        :deviceId => 1
      )
    ])
  end

  it "renders a list of patients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
