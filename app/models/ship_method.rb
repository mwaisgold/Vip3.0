class ShipMethod < ActiveRecord::Base
  has_and_belongs_to_many :items

end

# == Schema Information
#
# Table name: ship_methods
#
#  id          :integer(38)     not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

