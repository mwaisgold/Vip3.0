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

# == Schema Information
#
# Table name: reviews
#
#  id                 :integer(38)     not null, primary key
#  title              :string(255)
#  points             :integer(38)
#  customer_id        :integer(38)
#  catalog_product_id :integer(38)
#  pros               :text
#  contras            :text
#  conclusion         :text
#  qty_votes          :integer(38)
#  qty_pos            :integer(38)
#  created_at         :datetime
#  updated_at         :datetime
#

