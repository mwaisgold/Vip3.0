require 'spec_helper'

describe CatalogProductAttributes do
  before(:each) do
    @valid_attributes = {
      :key => "value for key",
      :value => "value for value",
      :catalog_product_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    CatalogProductAttributes.create!(@valid_attributes)
  end
end
