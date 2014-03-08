require 'spec_helper'

describe "care_groups/new" do
  before(:each) do
    assign(:care_group, stub_model(CareGroup,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new care_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", care_groups_path, "post" do
      assert_select "input#care_group_name[name=?]", "care_group[name]"
    end
  end
end
