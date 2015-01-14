class AddDimensionsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :dimensions_decimals, :string
    add_column :listings, :dimensins_fractions, :string
    add_column :listings, :condition, :string
    add_column :listings, :price_per_lb, :decimal, :precision => 15, :scale => 5
  end
end
