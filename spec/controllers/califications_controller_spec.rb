require 'spec_helper'

describe CalificationsController do

  def mock_calification(stubs={})
    @mock_calification ||= mock_model(Calification, stubs)
  end

  describe "GET index" do
    it "assigns all califications as @califications" do
      Calification.stub(:find).with(:all).and_return([mock_calification])
      get :index
      assigns[:califications].should == [mock_calification]
    end
  end

  describe "GET show" do
    it "assigns the requested calification as @calification" do
      Calification.stub(:find).with("37").and_return(mock_calification)
      get :show, :id => "37"
      assigns[:calification].should equal(mock_calification)
    end
  end

  describe "GET new" do
    it "assigns a new calification as @calification" do
      Calification.stub(:new).and_return(mock_calification)
      get :new
      assigns[:calification].should equal(mock_calification)
    end
  end

  describe "GET edit" do
    it "assigns the requested calification as @calification" do
      Calification.stub(:find).with("37").and_return(mock_calification)
      get :edit, :id => "37"
      assigns[:calification].should equal(mock_calification)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created calification as @calification" do
        Calification.stub(:new).with({'these' => 'params'}).and_return(mock_calification(:save => true))
        post :create, :calification => {:these => 'params'}
        assigns[:calification].should equal(mock_calification)
      end

      it "redirects to the created calification" do
        Calification.stub(:new).and_return(mock_calification(:save => true))
        post :create, :calification => {}
        response.should redirect_to(calification_url(mock_calification))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved calification as @calification" do
        Calification.stub(:new).with({'these' => 'params'}).and_return(mock_calification(:save => false))
        post :create, :calification => {:these => 'params'}
        assigns[:calification].should equal(mock_calification)
      end

      it "re-renders the 'new' template" do
        Calification.stub(:new).and_return(mock_calification(:save => false))
        post :create, :calification => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested calification" do
        Calification.should_receive(:find).with("37").and_return(mock_calification)
        mock_calification.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :calification => {:these => 'params'}
      end

      it "assigns the requested calification as @calification" do
        Calification.stub(:find).and_return(mock_calification(:update_attributes => true))
        put :update, :id => "1"
        assigns[:calification].should equal(mock_calification)
      end

      it "redirects to the calification" do
        Calification.stub(:find).and_return(mock_calification(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(calification_url(mock_calification))
      end
    end

    describe "with invalid params" do
      it "updates the requested calification" do
        Calification.should_receive(:find).with("37").and_return(mock_calification)
        mock_calification.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :calification => {:these => 'params'}
      end

      it "assigns the calification as @calification" do
        Calification.stub(:find).and_return(mock_calification(:update_attributes => false))
        put :update, :id => "1"
        assigns[:calification].should equal(mock_calification)
      end

      it "re-renders the 'edit' template" do
        Calification.stub(:find).and_return(mock_calification(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested calification" do
      Calification.should_receive(:find).with("37").and_return(mock_calification)
      mock_calification.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the califications list" do
      Calification.stub(:find).and_return(mock_calification(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(califications_url)
    end
  end

end
