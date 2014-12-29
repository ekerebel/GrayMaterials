class AddMaterialIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :material_id, :integer
  end
end
