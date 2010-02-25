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

# == Schema Information
#
# Table name: items
#
#  id          :integer(38)     not null, primary key
#  site_id     :string(255)
#  item_id     :integer(38)
#  title       :string(255)
#  image       :string(255)
#  description :text
#  price       :integer(38)
#  bids_count  :integer(38)
#  cust_id     :integer(38)
#  created_at  :datetime
#  updated_at  :datetime
#

