require "spec_helper"

describe BusinessUnitsController do
  describe "routing" do

    it "routes to #index" do
      get("/business_units").should route_to("business_units#index")
    end

    it "routes to #new" do
      get("/business_units/new").should route_to("business_units#new")
    end

    it "routes to #show" do
      get("/business_units/1").should route_to("business_units#show", :id => "1")
    end

    it "routes to #edit" do
      get("/business_units/1/edit").should route_to("business_units#edit", :id => "1")
    end

    it "routes to #create" do
      post("/business_units").should route_to("business_units#create")
    end

    it "routes to #update" do
      put("/business_units/1").should route_to("business_units#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/business_units/1").should route_to("business_units#destroy", :id => "1")
    end

  end
end
