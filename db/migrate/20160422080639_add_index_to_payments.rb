class AddIndexToPayments < ActiveRecord::Migration
  def change
    add_index :payments, [:feeder_id], unique: true
  end
end
