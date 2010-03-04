require 'spec_helper'

describe PaymentMethodsController do

  def mock_payment_method(stubs={})
    @mock_payment_method ||= mock_model(PaymentMethod, stubs)
  end

  describe "GET index" do
    it "assigns all payment_methods as @payment_methods" do
      PaymentMethod.stub(:find).with(:all).and_return([mock_payment_method])
      get :index
      assigns[:payment_methods].should == [mock_payment_method]
    end
  end

  describe "GET show" do
    it "assigns the requested payment_method as @payment_method" do
      PaymentMethod.stub(:find).with("37").and_return(mock_payment_method)
      get :show, :id => "37"
      assigns[:payment_method].should equal(mock_payment_method)
    end
  end

  describe "GET new" do
    it "assigns a new payment_method as @payment_method" do
      PaymentMethod.stub(:new).and_return(mock_payment_method)
      get :new
      assigns[:payment_method].should equal(mock_payment_method)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_method as @payment_method" do
      PaymentMethod.stub(:find).with("37").and_return(mock_payment_method)
      get :edit, :id => "37"
      assigns[:payment_method].should equal(mock_payment_method)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_method as @payment_method" do
        PaymentMethod.stub(:new).with({'these' => 'params'}).and_return(mock_payment_method(:save => true))
        post :create, :payment_method => {:these => 'params'}
        assigns[:payment_method].should equal(mock_payment_method)
      end

      it "redirects to the created payment_method" do
        PaymentMethod.stub(:new).and_return(mock_payment_method(:save => true))
        post :create, :payment_method => {}
        response.should redirect_to(payment_method_url(mock_payment_method))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_method as @payment_method" do
        PaymentMethod.stub(:new).with({'these' => 'params'}).and_return(mock_payment_method(:save => false))
        post :create, :payment_method => {:these => 'params'}
        assigns[:payment_method].should equal(mock_payment_method)
      end

      it "re-renders the 'new' template" do
        PaymentMethod.stub(:new).and_return(mock_payment_method(:save => false))
        post :create, :payment_method => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_method" do
        PaymentMethod.should_receive(:find).with("37").and_return(mock_payment_method)
        mock_payment_method.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_method => {:these => 'params'}
      end

      it "assigns the requested payment_method as @payment_method" do
        PaymentMethod.stub(:find).and_return(mock_payment_method(:update_attributes => true))
        put :update, :id => "1"
        assigns[:payment_method].should equal(mock_payment_method)
      end

      it "redirects to the payment_method" do
        PaymentMethod.stub(:find).and_return(mock_payment_method(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(payment_method_url(mock_payment_method))
      end
    end

    describe "with invalid params" do
      it "updates the requested payment_method" do
        PaymentMethod.should_receive(:find).with("37").and_return(mock_payment_method)
        mock_payment_method.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_method => {:these => 'params'}
      end

      it "assigns the payment_method as @payment_method" do
        PaymentMethod.stub(:find).and_return(mock_payment_method(:update_attributes => false))
        put :update, :id => "1"
        assigns[:payment_method].should equal(mock_payment_method)
      end

      it "re-renders the 'edit' template" do
        PaymentMethod.stub(:find).and_return(mock_payment_method(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_method" do
      PaymentMethod.should_receive(:find).with("37").and_return(mock_payment_method)
      mock_payment_method.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_methods list" do
      PaymentMethod.stub(:find).and_return(mock_payment_method(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(payment_methods_url)
    end
  end

end
