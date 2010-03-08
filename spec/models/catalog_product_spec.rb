require 'spec_helper'

describe CatalogProduct do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    CatalogProduct.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: catalog_products
#
#  id         :integer(38)     not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

