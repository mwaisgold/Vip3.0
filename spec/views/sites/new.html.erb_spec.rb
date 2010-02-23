require 'spec_helper'

describe "/sites/new.html.erb" do
  include SitesHelper

  before(:each) do
    assigns[:site] = stub_model(Site,
      :new_record? => true,
      :site_id => "value for site_id",
      :locale => "value for locale"
    )
  end

  it "renders new site form" do
    render

    response.should have_tag("form[action=?][method=post]", sites_path) do
      with_tag("input#site_site_id[name=?]", "site[site_id]")
      with_tag("input#site_locale[name=?]", "site[locale]")
    end
  end
end
