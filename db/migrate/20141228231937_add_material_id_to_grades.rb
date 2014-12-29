class AddMaterialIdToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :material_id, :integer
  end
end
