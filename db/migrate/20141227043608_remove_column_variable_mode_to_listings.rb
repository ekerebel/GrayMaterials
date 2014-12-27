class RemoveColumnVariableModeToListings < ActiveRecord::Migration
  def change
    remove_columns :listings, :variable_dimensions
    add_column :listings, :fixed_dimensions, :boolean
  end
end
