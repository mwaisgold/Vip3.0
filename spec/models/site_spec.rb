require 'spec_helper'

describe Site do
  fixtures :sites

  it "debe guardar un site con datos validos" do
    c = sites(:EBY)
    c.save.should be_equal(true)
  end

  it "NO debe guardar un site sin site_id ni locale" do
    c = Site.new
    c.save.should be_equal(false)
  end

end
# == Schema Information
#
# Table name: sites
#
#  id         :integer(38)     not null, primary key
#  site_id    :string(3)       not null
#  locale     :string(2)       not null
#  created_at :datetime
#  updated_at :datetime
#
