require 'spec_helper'

describe CalificationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/califications" }.should route_to(:controller => "califications", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/califications/new" }.should route_to(:controller => "califications", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/califications/1" }.should route_to(:controller => "califications", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/califications/1/edit" }.should route_to(:controller => "califications", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/califications" }.should route_to(:controller => "califications", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/califications/1" }.should route_to(:controller => "califications", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/califications/1" }.should route_to(:controller => "califications", :action => "destroy", :id => "1") 
    end
  end
end
