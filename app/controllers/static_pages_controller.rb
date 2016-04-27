class StaticPagesController < ApplicationController

	def home
	end


	def ranking
		@user = User.all
		feeder_record = {}
		feeding_record = {}
		@user.each do |user|
			feeder_count = user.feeders.where(paystatus: :authorized).count
			feeder_record[user.name]=feeder_count if feeder_count != 0

			feeding_count = user.feedings.count
			feeding_record[user.name]=feeding_count if feeding_count != 0
		end

		@feeder_ranking = feeder_record.sort_by {|k,v| -v}.first 10
		@feeder_first = @feeder_ranking.first
		@feeding_ranking = feeding_record.sort_by {|k,v| -v}.first 10
		@feeding_first =@feeding_ranking.first

	end 
	
end
