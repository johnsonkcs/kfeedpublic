class Feeding < ActiveRecord::Base

	belongs_to :user
	has_many :payments, :dependent => :destroy
	has_many :feeders, :dependent => :destroy
	validates_presence_of :date, :time, :place, :price, :feeding_pics, :pax_limit, :name
	mount_uploaders :feeding_pics, FeedingpicsUploader

	geocoded_by :place   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
	searchkick

end
