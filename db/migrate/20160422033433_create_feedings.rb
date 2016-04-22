class CreateFeedings < ActiveRecord::Migration
  def change
    create_table :feedings do |t|
      t.integer :user_id
      t.date :date
      t.string :time
      t.text :place
      t.float :latitude
      t.float :longitude
      t.integer :price
      t.string :feeding_pics
      t.integer :pax_limit

      t.timestamps null: false
    end
  end
end
