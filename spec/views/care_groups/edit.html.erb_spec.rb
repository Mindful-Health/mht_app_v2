require 'spec_helper'

describe "care_groups/edit" do
  before(:each) do
    @care_group = assign(:care_group, stub_model(CareGroup,
      :user_id => 1,
      :patient_id => 1
    ))
  end

  it "renders the edit care_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", care_group_path(@care_group), "post" do
      assert_select "input#care_group_user_id[name=?]", "care_group[user_id]"
      assert_select "input#care_group_patient_id[name=?]", "care_group[patient_id]"
    end
  end
end
