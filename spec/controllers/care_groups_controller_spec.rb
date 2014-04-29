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

describe CareGroupsController do
  render_views

  # This should return the minimal set of attributes required to create a valid
  # CareGroup. As you add validations to CareGroup, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CareGroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "renders a list of care_groups" do
      get :index, {}, valid_session
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "tr>td", :text => "Name".to_s, :count => 2
    end
    it "assigns all care_groups as @care_groups" do
      care_group = CareGroup.create! valid_attributes
      get :index, {}, valid_session
      assigns(:care_groups).should eq([care_group])
    end
  end

  describe "GET show" do

    it "renders attributes in <p>" do
      get :show, {:id => care_group.to_param}, valid_session
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        rendered.should match(/Name/)
    end

    it "assigns the requested care_group as @care_group" do
      care_group = CareGroup.create! valid_attributes
      get :show, {:id => care_group.to_param}, valid_session
      assigns(:care_group).should eq(care_group)
    end
  end

  describe "GET new" do
    it "renders new care_group form" do
      get :new, {}, valid_session
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", care_groups_path, "post" do
          assert_select "input#care_group_name[name=?]", "care_group[name]"
        end
    end
    it "assigns a new care_group as @care_group" do
      get :new, {}, valid_session
      assigns(:care_group).should be_a_new(CareGroup)
    end
  end

  describe "GET edit" do
    it "renders the edit care_group form" do
      get :edit, {:id => care_group.to_param}, valid_session
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", care_group_path(@care_group), "post" do
          assert_select "input#care_group_name[name=?]", "care_group[name]"
        end
    end
    it "assigns the requested care_group as @care_group" do
      care_group = CareGroup.create! valid_attributes
      get :edit, {:id => care_group.to_param}, valid_session
      assigns(:care_group).should eq(care_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CareGroup" do
        expect {
          post :create, {:care_group => valid_attributes}, valid_session
        }.to change(CareGroup, :count).by(1)
      end

      it "assigns a newly created care_group as @care_group" do
        post :create, {:care_group => valid_attributes}, valid_session
        assigns(:care_group).should be_a(CareGroup)
        assigns(:care_group).should be_persisted
      end

      it "redirects to the created care_group" do
        post :create, {:care_group => valid_attributes}, valid_session
        response.should redirect_to(CareGroup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved care_group as @care_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        CareGroup.any_instance.stub(:save).and_return(false)
        post :create, {:care_group => { "name" => "invalid value" }}, valid_session
        assigns(:care_group).should be_a_new(CareGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CareGroup.any_instance.stub(:save).and_return(false)
        post :create, {:care_group => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested care_group" do
        care_group = CareGroup.create! valid_attributes
        # Assuming there are no other care_groups in the database, this
        # specifies that the CareGroup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CareGroup.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => care_group.to_param, :care_group => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested care_group as @care_group" do
        care_group = CareGroup.create! valid_attributes
        put :update, {:id => care_group.to_param, :care_group => valid_attributes}, valid_session
        assigns(:care_group).should eq(care_group)
      end

      it "redirects to the care_group" do
        care_group = CareGroup.create! valid_attributes
        put :update, {:id => care_group.to_param, :care_group => valid_attributes}, valid_session
        response.should redirect_to(care_group)
      end
    end

    describe "with invalid params" do
      it "assigns the care_group as @care_group" do
        care_group = CareGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CareGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => care_group.to_param, :care_group => { "name" => "invalid value" }}, valid_session
        assigns(:care_group).should eq(care_group)
      end

      it "re-renders the 'edit' template" do
        care_group = CareGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CareGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => care_group.to_param, :care_group => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested care_group" do
      care_group = CareGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => care_group.to_param}, valid_session
      }.to change(CareGroup, :count).by(-1)
    end

    it "redirects to the care_groups list" do
      care_group = CareGroup.create! valid_attributes
      delete :destroy, {:id => care_group.to_param}, valid_session
      response.should redirect_to(care_groups_url)
    end
  end

end
