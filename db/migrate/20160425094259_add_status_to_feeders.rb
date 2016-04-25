class AddStatusToFeeders < ActiveRecord::Migration
  def change
  	add_column :feeders, :status, :string
  end
end
