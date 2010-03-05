require 'spec_helper'

describe CatalogProductAttributesController do

  def mock_catalog_product_attributes(stubs={})
    @mock_catalog_product_attributes ||= mock_model(CatalogProductAttributes, stubs)
  end

  describe "GET index" do
    it "assigns all catalog_product_attributes as @catalog_product_attributes" do
      CatalogProductAttributes.stub(:find).with(:all).and_return([mock_catalog_product_attributes])
      get :index
      assigns[:catalog_product_attributes].should == [mock_catalog_product_attributes]
    end
  end

  describe "GET show" do
    it "assigns the requested catalog_product_attributes as @catalog_product_attributes" do
      CatalogProductAttributes.stub(:find).with("37").and_return(mock_catalog_product_attributes)
      get :show, :id => "37"
      assigns[:catalog_product_attributes].should equal(mock_catalog_product_attributes)
    end
  end

  describe "GET new" do
    it "assigns a new catalog_product_attributes as @catalog_product_attributes" do
      CatalogProductAttributes.stub(:new).and_return(mock_catalog_product_attributes)
      get :new
      assigns[:catalog_product_attributes].should equal(mock_catalog_product_attributes)
    end
  end

  describe "GET edit" do
    it "assigns the requested catalog_product_attributes as @catalog_product_attributes" do
      CatalogProductAttributes.stub(:find).with("37").and_return(mock_catalog_product_attributes)
      get :edit, :id => "37"
      assigns[:catalog_product_attributes].should equal(mock_catalog_product_attributes)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created catalog_product_attributes as @catalog_product_attributes" do
        CatalogProductAttributes.stub(:new).with({'these' => 'params'}).and_return(mock_catalog_product_attributes(:save => true))
        post :create, :catalog_product_attributes => {:these => 'params'}
        assigns[:catalog_product_attributes].should equal(mock_catalog_product_attributes)
      end

      it "redirects to the created catalog_product_attributes" do
        CatalogProductAttributes.stub(:new).and_return(mock_catalog_product_attributes(:save => true))
        post :create, :catalog_product_attributes => {}
        response.should redirect_to(catalog_product_attribute_url(mock_catalog_product_attributes))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved catalog_product_attributes as @catalog_product_attributes" do
        CatalogProductAttributes.stub(:new).with({'these' => 'params'}).and_return(mock_catalog_product_attributes(:save => false))
        post :create, :catalog_product_attributes => {:these => 'params'}
        assigns[:catalog_product_attributes].should equal(mock_catalog_product_attributes)
      end

      it "re-renders the 'new' template" do
        CatalogProductAttributes.stub(:new).and_return(mock_catalog_product_attributes(:save => false))
        post :create, :catalog_product_attributes => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested catalog_product_attributes" do
        CatalogProductAttributes.should_receive(:find).with("37").and_return(mock_catalog_product_attributes)
        mock_catalog_product_attributes.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :catalog_product_attributes => {:these => 'params'}
      end

      it "assigns the requested catalog_product_attributes as @catalog_product_attributes" do
        CatalogProductAttributes.stub(:find).and_return(mock_catalog_product_attributes(:update_attributes => true))
        put :update, :id => "1"
        assigns[:catalog_product_attributes].should equal(mock_catalog_product_attributes)
      end

      it "redirects to the catalog_product_attributes" do
        CatalogProductAttributes.stub(:find).and_return(mock_catalog_product_attributes(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(catalog_product_attribute_url(mock_catalog_product_attributes))
      end
    end

    describe "with invalid params" do
      it "updates the requested catalog_product_attributes" do
        CatalogProductAttributes.should_receive(:find).with("37").and_return(mock_catalog_product_attributes)
        mock_catalog_product_attributes.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :catalog_product_attributes => {:these => 'params'}
      end

      it "assigns the catalog_product_attributes as @catalog_product_attributes" do
        CatalogProductAttributes.stub(:find).and_return(mock_catalog_product_attributes(:update_attributes => false))
        put :update, :id => "1"
        assigns[:catalog_product_attributes].should equal(mock_catalog_product_attributes)
      end

      it "re-renders the 'edit' template" do
        CatalogProductAttributes.stub(:find).and_return(mock_catalog_product_attributes(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested catalog_product_attributes" do
      CatalogProductAttributes.should_receive(:find).with("37").and_return(mock_catalog_product_attributes)
      mock_catalog_product_attributes.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the catalog_product_attributes list" do
      CatalogProductAttributes.stub(:find).and_return(mock_catalog_product_attributes(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(catalog_product_attributes_url)
    end
  end

end
