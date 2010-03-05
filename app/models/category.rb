class Category < ActiveRecord::Base
	belongs_to :category
	has_many :items
	has_many :categories
end
