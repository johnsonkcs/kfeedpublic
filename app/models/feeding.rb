class Feeding < ActiveRecord::Base
	
	has_many :payments, :dependent => :destroy
	has_many :feeders, :dependent => :destroy
	    geocoded_by :place   # can also be an IP address
    after_validation :geocode       # auto-fetch coordinates
end
