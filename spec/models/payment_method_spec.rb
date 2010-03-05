require 'spec_helper'

describe PaymentMethod do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :logo => "value for logo"
    }
  end

  it "should create a new instance given valid attributes" do
    PaymentMethod.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: payment_methods
#
#  id         :integer(38)     not null, primary key
#  name       :string(255)
#  logo       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

