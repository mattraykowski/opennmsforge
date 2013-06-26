require "spec_helper"

describe ConfigPacksController do
  describe "routing" do

    it "routes to #index" do
      get("/config_packs").should route_to("config_packs#index")
    end

    it "routes to #new" do
      get("/config_packs/new").should route_to("config_packs#new")
    end

    it "routes to #show" do
      get("/config_packs/1").should route_to("config_packs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/config_packs/1/edit").should route_to("config_packs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/config_packs").should route_to("config_packs#create")
    end

    it "routes to #update" do
      put("/config_packs/1").should route_to("config_packs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/config_packs/1").should route_to("config_packs#destroy", :id => "1")
    end

  end
end
