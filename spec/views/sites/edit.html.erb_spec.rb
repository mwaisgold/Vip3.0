require 'spec_helper'

describe "/sites/edit.html.erb" do
  include SitesHelper

  before(:each) do
    assigns[:site] = @site = stub_model(Site,
      :new_record? => false,
      :site_id => "value for site_id",
      :locale => "value for locale"
    )
  end

  it "renders the edit site form" do
    render

    response.should have_tag("form[action=#{site_path(@site)}][method=post]") do
      with_tag('input#site_site_id[name=?]', "site[site_id]")
      with_tag('input#site_locale[name=?]', "site[locale]")
    end
  end
end
