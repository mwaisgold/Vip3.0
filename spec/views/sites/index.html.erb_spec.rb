require 'spec_helper'

describe "/sites/index.html.erb" do
  include SitesHelper

  before(:each) do
    assigns[:sites] = [
      stub_model(Site,
        :site_id => "value for site_id",
        :locale => "value for locale"
      ),
      stub_model(Site,
        :site_id => "value for site_id",
        :locale => "value for locale"
      )
    ]
  end

  it "renders a list of sites" do
    render
    response.should have_tag("tr>td", "value for site_id".to_s, 2)
    response.should have_tag("tr>td", "value for locale".to_s, 2)
  end
end
