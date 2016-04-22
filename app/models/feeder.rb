class Feeder < ActiveRecord::Base
	has_many :payments :dependent => :destroy
end
