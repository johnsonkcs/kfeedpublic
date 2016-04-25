class Payment < ActiveRecord::Base
	belongs_to :feeder
	belongs_to :user
end
