class Site < ActiveRecord::Base
validates_presence_of :site_id
validates_presence_of :locale
validates_uniqueness_of :site_id

end
