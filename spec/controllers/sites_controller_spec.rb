require 'spec_helper'

describe SitesController do

  def mock_site(stubs={})
    @mock_site ||= mock_model(Site, stubs)
  end

  describe "GET index" do
    it "assigns all sites as @sites" do
      Site.stub(:find).with(:all).and_return([mock_site])
      get :index
      assigns[:sites].should == [mock_site]
    end
  end

  describe "GET show" do
    it "assigns the requested site as @site" do
      Site.stub(:find).with("37").and_return(mock_site)
      get :show, :id => "37"
      assigns[:site].should equal(mock_site)
    end
  end

  describe "GET new" do
    it "assigns a new site as @site" do
      Site.stub(:new).and_return(mock_site)
      get :new
      assigns[:site].should equal(mock_site)
    end
  end

  describe "GET edit" do
    it "assigns the requested site as @site" do
      Site.stub(:find).with("37").and_return(mock_site)
      get :edit, :id => "37"
      assigns[:site].should equal(mock_site)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created site as @site" do
        Site.stub(:new).with({'these' => 'params'}).and_return(mock_site(:save => true))
        post :create, :site => {:these => 'params'}
        assigns[:site].should equal(mock_site)
      end

      it "redirects to the created site" do
        Site.stub(:new).and_return(mock_site(:save => true))
        post :create, :site => {}
        response.should redirect_to(site_url(mock_site))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site as @site" do
        Site.stub(:new).with({'these' => 'params'}).and_return(mock_site(:save => false))
        post :create, :site => {:these => 'params'}
        assigns[:site].should equal(mock_site)
      end

      it "re-renders the 'new' template" do
        Site.stub(:new).and_return(mock_site(:save => false))
        post :create, :site => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested site" do
        Site.should_receive(:find).with("37").and_return(mock_site)
        mock_site.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :site => {:these => 'params'}
      end

      it "assigns the requested site as @site" do
        Site.stub(:find).and_return(mock_site(:update_attributes => true))
        put :update, :id => "1"
        assigns[:site].should equal(mock_site)
      end

      it "redirects to the site" do
        Site.stub(:find).and_return(mock_site(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(site_url(mock_site))
      end
    end

    describe "with invalid params" do
      it "updates the requested site" do
        Site.should_receive(:find).with("37").and_return(mock_site)
        mock_site.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :site => {:these => 'params'}
      end

      it "assigns the site as @site" do
        Site.stub(:find).and_return(mock_site(:update_attributes => false))
        put :update, :id => "1"
        assigns[:site].should equal(mock_site)
      end

      it "re-renders the 'edit' template" do
        Site.stub(:find).and_return(mock_site(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested site" do
      Site.should_receive(:find).with("37").and_return(mock_site)
      mock_site.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sites list" do
      Site.stub(:find).and_return(mock_site(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(sites_url)
    end
  end

end
