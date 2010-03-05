require 'spec_helper'

describe Review do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :points => 1,
      :customer_id => 1,
      :catalog_product_id => 1,
      :pros => "value for pros",
      :contras => "value for contras",
      :conclusion => "value for conclusion",
      :qty_votes => 1,
      :qty_pos => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Review.create!(@valid_attributes)
  end
end
