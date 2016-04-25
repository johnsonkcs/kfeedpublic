class AddPaystatusToFeeders < ActiveRecord::Migration
  def change
    add_column :feeders, :paystatus, :string, :default => "unauthorized"
  end
end
