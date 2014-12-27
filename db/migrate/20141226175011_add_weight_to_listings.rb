class AddWeightToListings < ActiveRecord::Migration
  def change
    add_column :listings, :weight, :decimal
    add_column :listings, :mode, :text
    add_column :listings, :minimum_weight, :text
  end
end
