class RenameColumnDiameterToListings < ActiveRecord::Migration
  def change
    rename_column :listings, :diameter, :D
  end
end
