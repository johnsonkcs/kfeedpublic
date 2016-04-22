class AddFeedingPicsToFeedings < ActiveRecord::Migration
  def change
    add_column :feedings, :feeding_pics, :json
  end
end
