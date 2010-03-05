class CatalogProduct < ActiveRecord::Base
	has_many :items
	has_many :catalog_product_attributes
end
