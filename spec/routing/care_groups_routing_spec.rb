require "spec_helper"

describe CareGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/care_groups").should route_to("care_groups#index")
    end

    it "routes to #new" do
      get("/care_groups/new").should route_to("care_groups#new")
    end

    it "routes to #show" do
      get("/care_groups/1").should route_to("care_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/care_groups/1/edit").should route_to("care_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/care_groups").should route_to("care_groups#create")
    end

    it "routes to #update" do
      put("/care_groups/1").should route_to("care_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/care_groups/1").should route_to("care_groups#destroy", :id => "1")
    end

  end
end
