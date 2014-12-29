class RemoveGradeFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :grade, :string
  end
end
