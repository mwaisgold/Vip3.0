require 'spec_helper'

describe CatalogProductsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/catalog_products" }.should route_to(:controller => "catalog_products", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/catalog_products/new" }.should route_to(:controller => "catalog_products", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/catalog_products/1" }.should route_to(:controller => "catalog_products", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/catalog_products/1/edit" }.should route_to(:controller => "catalog_products", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/catalog_products" }.should route_to(:controller => "catalog_products", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/catalog_products/1" }.should route_to(:controller => "catalog_products", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/catalog_products/1" }.should route_to(:controller => "catalog_products", :action => "destroy", :id => "1") 
    end
  end
end
