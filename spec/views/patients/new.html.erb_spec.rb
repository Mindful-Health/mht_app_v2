require 'spec_helper'

describe "patients/new" do
  before(:each) do
    assign(:patient, stub_model(Patient,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :condition => "MyText",
      :deviceId => 1
    ).as_new_record)
  end

  it "renders new patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patients_path, "post" do
      assert_select "input#patient_name[name=?]", "patient[name]"
      assert_select "input#patient_email[name=?]", "patient[email]"
      assert_select "input#patient_phone[name=?]", "patient[phone]"
      assert_select "textarea#patient_condition[name=?]", "patient[condition]"
      assert_select "input#patient_deviceId[name=?]", "patient[deviceId]"
    end
  end
end
