class AddMaximumWidthToListings < ActiveRecord::Migration
  def change
    add_column :listings, :maximum_width, :decimal, :precision => 15, :scale => 5
    add_column :listings, :maximum_length, :decimal, :precision => 15, :scale => 5
  end
end
