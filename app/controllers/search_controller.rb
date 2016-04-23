class SearchController < ApplicationController
	def search
       if params[:q].nil?
        @feedings = []
       else
        @feedings = Feeding.search params[:q]
       end

       @hash = Gmaps4rails.build_markers(@feedings) do |feeding, marker|
          marker.lat feeding.latitude
          marker.lng feeding.longitude
          marker.infowindow feeding.name
       end

    end
end
