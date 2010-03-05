require 'spec_helper'

describe Calification do
  before(:each) do
    @valid_attributes = {
      :customer_id => 1,
      :item_id => 1,
      :texto_calif => "value for texto_calif",
      :value_calif => 1,
      :fecha => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Calification.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: califications
#
#  id          :integer(38)     not null, primary key
#  customer_id :integer(38)
#  item_id     :integer(38)
#  texto_calif :text
#  value_calif :integer(38)
#  fecha       :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

