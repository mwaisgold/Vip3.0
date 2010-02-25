require 'spec_helper'

describe "/items/new.html.erb" do
  include ItemsHelper

  before(:each) do
    assigns[:item] = stub_model(Item,
      :new_record? => true,
      :site_id => "value for site_id",
      :item_id => 1,
      :title => "value for title",
      :image => "value for image",
      :description => "value for description",
      :price => 9.99,
      :bids_count =>1 ,
      :cust_id => 1
    )
  end

  it "renders new item form" do
    render

    response.should have_tag("form[action=?][method=post]", items_path) do
      with_tag("input#item_site_id[name=?]", "item[site_id]")
      with_tag("input#item_item_id[name=?]", "item[item_id]")
      with_tag("input#item_title[name=?]", "item[title]")
      with_tag("input#item_image[name=?]", "item[image]")
      with_tag("textarea#item_description[name=?]", "item[description]")
      with_tag("input#item_price[name=?]", "item[price]")
      with_tag("input#item_bids_count[name=?]", "item[bids_count]")
      with_tag("input#item_cust_id[name=?]", "item[cust_id]")
    end
  end
end
