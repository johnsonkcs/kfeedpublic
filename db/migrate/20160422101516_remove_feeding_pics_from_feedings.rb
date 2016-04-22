class RemoveFeedingPicsFromFeedings < ActiveRecord::Migration
  def change
    remove_column :feedings, :feeding_pics, :string
  end
end
