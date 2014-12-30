class AddColumnsToShapes < ActiveRecord::Migration
  def change
    add_column :shapes, :OD, :boolean
    add_column :shapes, :wall, :boolean
    add_column :shapes, :dimension_ID, :boolean
    add_column :shapes, :minimum_width, :boolean
    add_column :shapes, :minimum_length, :boolean
    add_column :shapes, :volume_formula, :text
    rename_column :shapes, :diameter, :D
    add_column :listings, :OD, :decimal
    change_column :listings, :OD, :decimal, :precision => 15, :scale => 5
    add_column :listings, :wall, :decimal
    change_column :listings, :wall, :decimal, :precision => 15, :scale => 5
    add_column :listings, :dimension_ID, :decimal
    change_column :listings, :dimension_ID, :decimal, :precision => 15, :scale => 5
  end
end
