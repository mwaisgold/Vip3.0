require 'spec_helper'

describe CatalogProductsController do

  def mock_catalog_product(stubs={})
    @mock_catalog_product ||= mock_model(CatalogProduct, stubs)
  end

  describe "GET index" do
    it "assigns all catalog_products as @catalog_products" do
      CatalogProduct.stub(:find).with(:all).and_return([mock_catalog_product])
      get :index
      assigns[:catalog_products].should == [mock_catalog_product]
    end
  end

  describe "GET show" do
    it "assigns the requested catalog_product as @catalog_product" do
      CatalogProduct.stub(:find).with("37").and_return(mock_catalog_product)
      get :show, :id => "37"
      assigns[:catalog_product].should equal(mock_catalog_product)
    end
  end

  describe "GET new" do
    it "assigns a new catalog_product as @catalog_product" do
      CatalogProduct.stub(:new).and_return(mock_catalog_product)
      get :new
      assigns[:catalog_product].should equal(mock_catalog_product)
    end
  end

  describe "GET edit" do
    it "assigns the requested catalog_product as @catalog_product" do
      CatalogProduct.stub(:find).with("37").and_return(mock_catalog_product)
      get :edit, :id => "37"
      assigns[:catalog_product].should equal(mock_catalog_product)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created catalog_product as @catalog_product" do
        CatalogProduct.stub(:new).with({'these' => 'params'}).and_return(mock_catalog_product(:save => true))
        post :create, :catalog_product => {:these => 'params'}
        assigns[:catalog_product].should equal(mock_catalog_product)
      end

      it "redirects to the created catalog_product" do
        CatalogProduct.stub(:new).and_return(mock_catalog_product(:save => true))
        post :create, :catalog_product => {}
        response.should redirect_to(catalog_product_url(mock_catalog_product))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved catalog_product as @catalog_product" do
        CatalogProduct.stub(:new).with({'these' => 'params'}).and_return(mock_catalog_product(:save => false))
        post :create, :catalog_product => {:these => 'params'}
        assigns[:catalog_product].should equal(mock_catalog_product)
      end

      it "re-renders the 'new' template" do
        CatalogProduct.stub(:new).and_return(mock_catalog_product(:save => false))
        post :create, :catalog_product => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested catalog_product" do
        CatalogProduct.should_receive(:find).with("37").and_return(mock_catalog_product)
        mock_catalog_product.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :catalog_product => {:these => 'params'}
      end

      it "assigns the requested catalog_product as @catalog_product" do
        CatalogProduct.stub(:find).and_return(mock_catalog_product(:update_attributes => true))
        put :update, :id => "1"
        assigns[:catalog_product].should equal(mock_catalog_product)
      end

      it "redirects to the catalog_product" do
        CatalogProduct.stub(:find).and_return(mock_catalog_product(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(catalog_product_url(mock_catalog_product))
      end
    end

    describe "with invalid params" do
      it "updates the requested catalog_product" do
        CatalogProduct.should_receive(:find).with("37").and_return(mock_catalog_product)
        mock_catalog_product.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :catalog_product => {:these => 'params'}
      end

      it "assigns the catalog_product as @catalog_product" do
        CatalogProduct.stub(:find).and_return(mock_catalog_product(:update_attributes => false))
        put :update, :id => "1"
        assigns[:catalog_product].should equal(mock_catalog_product)
      end

      it "re-renders the 'edit' template" do
        CatalogProduct.stub(:find).and_return(mock_catalog_product(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested catalog_product" do
      CatalogProduct.should_receive(:find).with("37").and_return(mock_catalog_product)
      mock_catalog_product.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the catalog_products list" do
      CatalogProduct.stub(:find).and_return(mock_catalog_product(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(catalog_products_url)
    end
  end

end
