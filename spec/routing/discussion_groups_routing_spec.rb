require "spec_helper"

describe DiscussionGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/discussion_groups").should route_to("discussion_groups#index")
    end

    it "routes to #new" do
      get("/discussion_groups/new").should route_to("discussion_groups#new")
    end

    it "routes to #show" do
      get("/discussion_groups/1").should route_to("discussion_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/discussion_groups/1/edit").should route_to("discussion_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/discussion_groups").should route_to("discussion_groups#create")
    end

    it "routes to #update" do
      put("/discussion_groups/1").should route_to("discussion_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/discussion_groups/1").should route_to("discussion_groups#destroy", :id => "1")
    end

  end
end
