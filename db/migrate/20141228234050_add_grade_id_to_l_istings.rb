class AddGradeIdToLIstings < ActiveRecord::Migration
  def change
    add_column :listings, :grade_id, :integer
  end
end
