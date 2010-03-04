class Customer < ActiveRecord::Base
	has_many :items

end

# == Schema Information
#
# Table name: customers
#
#  id         :integer(38)     not null, primary key
#  nickname   :string(20)
#  points     :integer(38)
#  qty_calif  :integer(38)
#  created_at :datetime
#  updated_at :datetime
#

