class AddNameToFeedings < ActiveRecord::Migration
  def change
    add_column :feedings, :name, :string
  end
end
