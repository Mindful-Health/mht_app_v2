require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PatientsController do
  render_views
  # This should return the minimal set of attributes required to create a valid
  # Patient. As you add validations to Patient, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PatientsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do

    it "renders a list of patients" do
      @request.env["devise.mapping"] = Devise.mappings[:patient]
        get :index, {}, valid_session
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        page.has_selector?('tr>td', :text => "Name" )
        page.has_selector?("tr>td", :text => "Email")
        page.has_selector?("tr>td", :text => "Phone")
        page.has_selector?("tr>td", :text => "MyText")
        page.has_selector?("tr>td", :text => 1)

    end #end render list

    it "assigns all patients as @patients" do
      patient = Patient.create! valid_attributes
      get :index, {}, valid_session
      assigns(:patients).should eq([patient])
    end
  end

  describe "GET show" do
    it "assigns the requested patient as @patient" do
      patient = Patient.create! valid_attributes
      get :show, {:id => patient.to_param}, valid_session
      assigns(:patient).should eq(patient)
    end
  #  it "renders attributes in <p>" do
  #    @request.env["devise.mapping"] = Devise.mappings[:patient]
  #    get :show, {:id => patient.to_param}, valid_session
        # Run the generator again with the --webrat flag if you want to use webrat matchers
  #      rendered.should match(/Name/)
  #      rendered.should match(/Email/)
  #      rendered.should match(/Phone/)
  #      rendered.should match(/MyText/)
  #      rendered.should match(/1/)
   # end

  end

  describe "GET new" do

    it "renders new patient form" do
      get :new, {}, valid_session
      @request.env["devise.mapping"] = Devise.mappings[:patient]
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", patients_path, "post" do
          assert_select "input#patient_name[name=?]", "patient[name]"
          assert_select "input#patient_email[name=?]", "patient[email]"
          assert_select "input#patient_phone[name=?]", "patient[phone]"
          assert_select "textarea#patient_condition[name=?]", "patient[condition]"
          assert_select "input#patient_deviceId[name=?]", "patient[deviceId]"
        end
    end #end render form
    it "assigns a new patient as @patient" do
      get :new, {}, valid_session
      assigns(:patient).should be_a_new(Patient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Patient" do
        expect {
          post :create, {:patient => valid_attributes}, valid_session
        }.to change(Patient, :count).by(1)
      end

      it "assigns a newly created patient as @patient" do
        post :create, {:patient => valid_attributes}, valid_session
        assigns(:patient).should be_a(Patient)
        assigns(:patient).should be_persisted
      end

      it "redirects to the created patient" do
        post :create, {:patient => valid_attributes}, valid_session
        response.should redirect_to(Patient.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient as @patient" do
        # Trigger the behavior that occurs when invalid params are submitted
        Patient.any_instance.stub(:save).and_return(false)
        post :create, {:patient => { "name" => "invalid value" }}, valid_session
        assigns(:patient).should be_a_new(Patient)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Patient.any_instance.stub(:save).and_return(false)
        post :create, {:patient => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested patient" do
        patient = Patient.create! valid_attributes
        # Assuming there are no other patients in the database, this
        # specifies that the Patient created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Patient.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => patient.to_param, :patient => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested patient as @patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => valid_attributes}, valid_session
        assigns(:patient).should eq(patient)
      end

      it "redirects to the patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => valid_attributes}, valid_session
        response.should redirect_to(patient)
      end
    end

    describe "with invalid params" do
      it "assigns the patient as @patient" do
        patient = Patient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Patient.any_instance.stub(:save).and_return(false)
        put :update, {:id => patient.to_param, :patient => { "name" => "invalid value" }}, valid_session
        assigns(:patient).should eq(patient)
      end

      it "re-renders the 'edit' template" do
        patient = Patient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Patient.any_instance.stub(:save).and_return(false)
        put :update, {:id => patient.to_param, :patient => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested patient" do
      patient = Patient.create! valid_attributes
      expect {
        delete :destroy, {:id => patient.to_param}, valid_session
      }.to change(Patient, :count).by(-1)
    end

    it "redirects to the patients list" do
      patient = Patient.create! valid_attributes
      delete :destroy, {:id => patient.to_param}, valid_session
      response.should redirect_to(patients_url)
    end
  end

end
