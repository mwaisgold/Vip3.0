require 'spec_helper'

describe ShipMethodsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/ship_methods" }.should route_to(:controller => "ship_methods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ship_methods/new" }.should route_to(:controller => "ship_methods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ship_methods/1" }.should route_to(:controller => "ship_methods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ship_methods/1/edit" }.should route_to(:controller => "ship_methods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ship_methods" }.should route_to(:controller => "ship_methods", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/ship_methods/1" }.should route_to(:controller => "ship_methods", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ship_methods/1" }.should route_to(:controller => "ship_methods", :action => "destroy", :id => "1") 
    end
  end
end
