require 'spec_helper'

describe "/items/show.html.erb" do
  include ItemsHelper
  before(:each) do
    assigns[:item] = @item = stub_model(Item,
      :site_id => "value for site_id",
      :item_id => ,
      :title => "value for title",
      :image => "value for image",
      :description => "value for description",
      :price => 9.99,
      :bids_count => ,
      :cust_id => 
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ site_id/)
    response.should have_text(//)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ image/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/9\.99/)
    response.should have_text(//)
    response.should have_text(//)
  end
end
