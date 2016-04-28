class AddIndexToFeedings < ActiveRecord::Migration
  def change
  	add_index :feedings, :user_id
  	add_index :feedings, :date
  	add_index :feedings, :time
  	add_index :feedings, :place
  	add_index :feedings, :latitude
  	add_index :feedings, :longitude
  	add_index :feedings, :price
  	add_index :feedings, :pax_limit
  	add_index :feedings, :created_at
  	add_index :feedings, :updated_at
  	add_index :feedings, :feeding_pics
  	add_index :feedings, :name
  end
end
