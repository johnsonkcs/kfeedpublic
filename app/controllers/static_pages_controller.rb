class StaticPagesController < ApplicationController

	def home
	end


	def ranking
		@user = User.all
		feeder_record = {}
		feeding_record = {}
		@user.each do |user|
			feeder_count = user.feeders.where(paystatus: :authorized).count
			feeder_record[user.email]=feeder_count if feeder_count != 0

			feeding_count = user.feedings.count
			feeding_record[user.email]=feeding_count if feeding_count != 0
		end

		@feeder_ranking = feeder_record.sort_by {|k,v| -v}.first 10
		@feeding_ranking = feeding_record.sort_by {|k,v| -v}.first 10

	end 
	
end
