require 'spec_helper'

describe SitesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/sites" }.should route_to(:controller => "sites", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sites/new" }.should route_to(:controller => "sites", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sites/1" }.should route_to(:controller => "sites", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sites/1/edit" }.should route_to(:controller => "sites", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sites" }.should route_to(:controller => "sites", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/sites/1" }.should route_to(:controller => "sites", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sites/1" }.should route_to(:controller => "sites", :action => "destroy", :id => "1") 
    end
  end
end
