require 'spec_helper'

describe PaymentMethodsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/payment_methods" }.should route_to(:controller => "payment_methods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/payment_methods/new" }.should route_to(:controller => "payment_methods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/payment_methods/1" }.should route_to(:controller => "payment_methods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/payment_methods/1/edit" }.should route_to(:controller => "payment_methods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/payment_methods" }.should route_to(:controller => "payment_methods", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/payment_methods/1" }.should route_to(:controller => "payment_methods", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/payment_methods/1" }.should route_to(:controller => "payment_methods", :action => "destroy", :id => "1") 
    end
  end
end
