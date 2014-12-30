class RenameColumnToShapes < ActiveRecord::Migration
  def change
    rename_column :shapes, :minimum_width, :maximum_width
    rename_column :shapes, :minimum_length, :maximum_length
  end
end
