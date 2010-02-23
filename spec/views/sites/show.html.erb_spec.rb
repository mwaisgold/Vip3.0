require 'spec_helper'

describe "/sites/show.html.erb" do
  include SitesHelper
  before(:each) do
    assigns[:site] = @site = stub_model(Site,
      :site_id => "value for site_id",
      :locale => "value for locale"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ site_id/)
    response.should have_text(/value\ for\ locale/)
  end
end
