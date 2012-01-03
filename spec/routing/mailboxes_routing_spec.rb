require "spec_helper"

describe MailboxesController do
  describe "routing" do

    it "routes to #index" do
      get("/mailboxes").should route_to("mailboxes#index")
    end

    it "routes to #new" do
      get("/mailboxes/new").should route_to("mailboxes#new")
    end

    it "routes to #show" do
      get("/mailboxes/1").should route_to("mailboxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mailboxes/1/edit").should route_to("mailboxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mailboxes").should route_to("mailboxes#create")
    end

    it "routes to #update" do
      put("/mailboxes/1").should route_to("mailboxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mailboxes/1").should route_to("mailboxes#destroy", :id => "1")
    end

  end
end
