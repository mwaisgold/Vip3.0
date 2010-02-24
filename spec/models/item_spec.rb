require 'spec_helper'

describe Item do
  before(:each) do
    @valid_attributes = {
      :site_id => "MLA",
      :item_id => 134578,
      :title => "Titulo de testeo",
      :image => "",
      :description => "descripcionnn",
      :price => 9.99,
      :bids_count => 2,
      :cust_id => 43565677
    }
  end

  it "should create a new instance given valid attributes" do
    Item.create!(@valid_attributes)
  end
end
