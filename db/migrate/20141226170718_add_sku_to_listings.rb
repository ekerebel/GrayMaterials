class AddSkuToListings < ActiveRecord::Migration
  def change
    add_column :listings, :SKU, :text
    add_column :listings, :A, :decimal
    add_column :listings, :B, :decimal
    add_column :listings, :C, :decimal
    add_column :listings, :diameter, :decimal
    add_column :listings, :thickness, :decimal
    add_column :listings, :width, :decimal
    add_column :listings, :length, :decimal
    add_column :listings, :grade, :text
    add_column :listings, :material, :text
    add_column :listings, :specification, :text
    add_column :listings, :inventory, :integer
  end
end
