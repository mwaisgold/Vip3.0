require 'spec_helper'

describe CatalogProductAttributesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/catalog_product_attributes" }.should route_to(:controller => "catalog_product_attributes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/catalog_product_attributes/new" }.should route_to(:controller => "catalog_product_attributes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/catalog_product_attributes/1" }.should route_to(:controller => "catalog_product_attributes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/catalog_product_attributes/1/edit" }.should route_to(:controller => "catalog_product_attributes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/catalog_product_attributes" }.should route_to(:controller => "catalog_product_attributes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/catalog_product_attributes/1" }.should route_to(:controller => "catalog_product_attributes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/catalog_product_attributes/1" }.should route_to(:controller => "catalog_product_attributes", :action => "destroy", :id => "1") 
    end
  end
end
