require 'spec_helper'

describe Item do
  before(:each) do
    @valid_attributes = {
      :site_id => "value for site_id",
      :item_id => ,
      :title => "value for title",
      :image => "value for image",
      :description => "value for description",
      :price => 9.99,
      :bids_count => ,
      :cust_id => 
    }
  end

  it "should create a new instance given valid attributes" do
    Item.create!(@valid_attributes)
  end
end
