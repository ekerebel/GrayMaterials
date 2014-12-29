class RemoveMaterialFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :material, :string
  end
end
