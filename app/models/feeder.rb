class Feeder < ActiveRecord::Base
	has_many :payments, :dependent => :destroy
	belongs_to :feeding
	belongs_to :user
end
