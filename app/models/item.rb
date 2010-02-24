class Item < ActiveRecord::Base
validates_presence_of :site_id, :item_id, :title, :cust_id, :price, :bids_count


end
