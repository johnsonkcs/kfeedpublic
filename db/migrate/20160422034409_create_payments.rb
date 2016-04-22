class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :feeder_id
      t.string :braintree_id
      t.string :status
      t.string :last_4

      t.timestamps null: false
    end
  end
end
