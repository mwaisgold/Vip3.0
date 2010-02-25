require 'spec_helper'

describe Item do

  fixtures :items
  
  it "deberia validar que el customer exista en ML para persistir" do
    i = items(:one)
    #seteo un cust_id que no existe en ML
    i.cust_id = 1
    i.valid?.should be_false
    i.errors.on(:cust_id).should_not be_nil
  end

  it "deberia validar que el site_id exista" do
    i = items(:one)
    #seteo un site_id que no exista
    i.site_id = "XXX"
    i.valid?.should be_false
    i.errors.on(:site_id).should_not be_nil
  end

end


# == Schema Information
#
# Table name: items
#
#  id          :integer(38)     not null, primary key
#  item_id     :integer(38)
#  title       :string(255)
#  image       :string(255)
#  description :text
#  price       :integer(38)
#  bids_count  :integer(38)
#  cust_id     :integer(38)
#  created_at  :datetime
#  updated_at  :datetime
#  site_id     :integer(38)     not null
#

