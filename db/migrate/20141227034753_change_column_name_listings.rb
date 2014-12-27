class ChangeColumnNameListings < ActiveRecord::Migration
  def change
    rename_column :listings, :minimum_weight, :minimum_quantity
  end
end
