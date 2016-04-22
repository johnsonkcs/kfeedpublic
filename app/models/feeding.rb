class Feeding < ActiveRecord::Base
	    geocoded_by :place   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates
end
