class CreateFeeders < ActiveRecord::Migration
  def change
    create_table :feeders do |t|
      t.integer :user_id
      t.integer :feeding_id

      t.timestamps null: false
    end
  end
end
