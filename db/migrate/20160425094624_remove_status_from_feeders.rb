class RemoveStatusFromFeeders < ActiveRecord::Migration
  def change
  	remove_column :feeders, :status, :string
  end
end
