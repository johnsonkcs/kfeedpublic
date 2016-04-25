class Feeder < ActiveRecord::Base

	
	belongs_to :feeding
	belongs_to :user
	has_many :payments, :dependent => :destroy

end
