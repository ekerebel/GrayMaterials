class AddShapeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :shape_id, :integer
  end
end
