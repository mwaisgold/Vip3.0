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
