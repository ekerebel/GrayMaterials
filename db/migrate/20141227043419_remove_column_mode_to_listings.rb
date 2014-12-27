class RemoveColumnModeToListings < ActiveRecord::Migration
  def change
    remove_column :listings, :mode
    add_column :listings, :variable_dimensions, :boolean
  end
end
