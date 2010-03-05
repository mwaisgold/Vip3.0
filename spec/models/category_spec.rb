require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :Category => ,
      :accept_items => false
    }
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@valid_attributes)
  end
end
