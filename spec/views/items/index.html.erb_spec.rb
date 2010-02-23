require 'spec_helper'

describe "/items/index.html.erb" do
  include ItemsHelper

  before(:each) do
    assigns[:items] = [
      stub_model(Item,
        :site_id => "value for site_id",
        :item_id => ,
        :title => "value for title",
        :image => "value for image",
        :description => "value for description",
        :price => 9.99,
        :bids_count => ,
        :cust_id => 
      ),
      stub_model(Item,
        :site_id => "value for site_id",
        :item_id => ,
        :title => "value for title",
        :image => "value for image",
        :description => "value for description",
        :price => 9.99,
        :bids_count => ,
        :cust_id => 
      )
    ]
  end

  it "renders a list of items" do
    render
    response.should have_tag("tr>td", "value for site_id".to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for image".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
  end
end
