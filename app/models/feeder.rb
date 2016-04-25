class Feeder < ActiveRecord::Base
	
	belongs_to :feeding
	belongs_to :user
end
