class ChangeColumnFixedDimensionToListings < ActiveRecord::Migration
  def change
    change_column :listings, :fixed_dimensions, :boolean, :default =>true
    change_column :listings, :inventory, :integer, :default =>1
  end
end
