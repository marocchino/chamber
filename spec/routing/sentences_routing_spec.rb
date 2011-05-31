require "spec_helper"

describe SentencesController do
  describe "routing" do

    it "routes to #index" do
      get("/sentences").should route_to("sentences#index")
    end

    it "routes to #new" do
      get("/sentences/new").should route_to("sentences#new")
    end

    it "routes to #show" do
      get("/sentences/1").should route_to("sentences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sentences/1/edit").should route_to("sentences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sentences").should route_to("sentences#create")
    end

    it "routes to #update" do
      put("/sentences/1").should route_to("sentences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sentences/1").should route_to("sentences#destroy", :id => "1")
    end

  end
end
