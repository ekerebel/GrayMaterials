class AddDiamaterToShapes < ActiveRecord::Migration
  def change
    add_column :shapes, :diameter, :boolean
  end
end
