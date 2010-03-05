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

# == Schema Information
#
# Table name: categories
#
#  id           :integer(38)     not null, primary key
#  name         :string(255)
#  category_id  :integer(38)
#  accept_items :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#

