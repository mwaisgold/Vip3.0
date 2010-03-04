require 'spec_helper'

describe ShipMethodsController do

  def mock_ship_methods(stubs={})
    @mock_ship_methods ||= mock_model(ShipMethods, stubs)
  end

  describe "GET index" do
    it "assigns all ship_methods as @ship_methods" do
      ShipMethods.stub(:find).with(:all).and_return([mock_ship_methods])
      get :index
      assigns[:ship_methods].should == [mock_ship_methods]
    end
  end

  describe "GET show" do
    it "assigns the requested ship_methods as @ship_methods" do
      ShipMethods.stub(:find).with("37").and_return(mock_ship_methods)
      get :show, :id => "37"
      assigns[:ship_methods].should equal(mock_ship_methods)
    end
  end

  describe "GET new" do
    it "assigns a new ship_methods as @ship_methods" do
      ShipMethods.stub(:new).and_return(mock_ship_methods)
      get :new
      assigns[:ship_methods].should equal(mock_ship_methods)
    end
  end

  describe "GET edit" do
    it "assigns the requested ship_methods as @ship_methods" do
      ShipMethods.stub(:find).with("37").and_return(mock_ship_methods)
      get :edit, :id => "37"
      assigns[:ship_methods].should equal(mock_ship_methods)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created ship_methods as @ship_methods" do
        ShipMethods.stub(:new).with({'these' => 'params'}).and_return(mock_ship_methods(:save => true))
        post :create, :ship_methods => {:these => 'params'}
        assigns[:ship_methods].should equal(mock_ship_methods)
      end

      it "redirects to the created ship_methods" do
        ShipMethods.stub(:new).and_return(mock_ship_methods(:save => true))
        post :create, :ship_methods => {}
        response.should redirect_to(ship_method_url(mock_ship_methods))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ship_methods as @ship_methods" do
        ShipMethods.stub(:new).with({'these' => 'params'}).and_return(mock_ship_methods(:save => false))
        post :create, :ship_methods => {:these => 'params'}
        assigns[:ship_methods].should equal(mock_ship_methods)
      end

      it "re-renders the 'new' template" do
        ShipMethods.stub(:new).and_return(mock_ship_methods(:save => false))
        post :create, :ship_methods => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested ship_methods" do
        ShipMethods.should_receive(:find).with("37").and_return(mock_ship_methods)
        mock_ship_methods.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ship_methods => {:these => 'params'}
      end

      it "assigns the requested ship_methods as @ship_methods" do
        ShipMethods.stub(:find).and_return(mock_ship_methods(:update_attributes => true))
        put :update, :id => "1"
        assigns[:ship_methods].should equal(mock_ship_methods)
      end

      it "redirects to the ship_methods" do
        ShipMethods.stub(:find).and_return(mock_ship_methods(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(ship_method_url(mock_ship_methods))
      end
    end

    describe "with invalid params" do
      it "updates the requested ship_methods" do
        ShipMethods.should_receive(:find).with("37").and_return(mock_ship_methods)
        mock_ship_methods.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ship_methods => {:these => 'params'}
      end

      it "assigns the ship_methods as @ship_methods" do
        ShipMethods.stub(:find).and_return(mock_ship_methods(:update_attributes => false))
        put :update, :id => "1"
        assigns[:ship_methods].should equal(mock_ship_methods)
      end

      it "re-renders the 'edit' template" do
        ShipMethods.stub(:find).and_return(mock_ship_methods(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested ship_methods" do
      ShipMethods.should_receive(:find).with("37").and_return(mock_ship_methods)
      mock_ship_methods.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ship_methods list" do
      ShipMethods.stub(:find).and_return(mock_ship_methods(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(ship_methods_url)
    end
  end

end
