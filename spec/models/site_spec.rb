require 'spec_helper'

describe Site do
  before(:each) do
    @valid_attributes = {
      :site_id => "value for site_id",
      :locale => "value for locale"
    }
  end

  it "should create a new instance given valid attributes" do
    Site.create!(@valid_attributes)
  end
end
